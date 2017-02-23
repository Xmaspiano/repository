package com.asiagroup.app.service.impl;

import com.asiagroup.app.entity.Answer;
import com.asiagroup.app.entity.Pencil;
import com.asiagroup.app.entity.PencilImg;
import com.asiagroup.app.entity.Touser;
import com.asiagroup.app.page.BellPage;
import com.asiagroup.app.page.PencilPage;
import com.asiagroup.app.pojo.PencilPojoMsg;
import com.asiagroup.app.repository.PencilRepository;
import com.asiagroup.app.service.AnswerService;
import com.asiagroup.app.service.PencilImgService;
import com.asiagroup.app.service.PencilService;
import com.asiagroup.app.service.TouserService;
import com.asiagroup.system.entity.Hrmresource;
import com.asiagroup.system.service.HrmresourceService;
import com.asiagroup.system.service.impl.CommonServiceImpl;
import com.asiagroup.util.SystemCommon;
import com.asiagroup.util.subscriber.SubscriberManagerImpl;
import com.drew.imaging.jpeg.JpegProcessingException;
import com.drew.metadata.MetadataException;
import org.apache.shiro.SecurityUtils;
import org.hibernate.Transaction;
import org.hibernate.mapping.Array;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.criteria.*;
import java.io.IOException;
import java.util.*;

/**
 * Created by AlbertXmas on 2017/1/12.
 */
@Service
//@Transactional
public class PencilServiceImpl
        extends CommonServiceImpl<Pencil, PencilRepository>
        implements PencilService  {

    @Autowired
    TouserService touserService;
    @Autowired
    PencilImgService pencilImgService;
    @Autowired
    HrmresourceService hrmresourceService;
    @Autowired
    AnswerService answerService;

    @Autowired
    SystemCommon systemCommon;

    public Pencil saveAndCallBack(PencilPage pencilPage) throws CloneNotSupportedException, IOException, JpegProcessingException {
        boolean sendOrChange = false;

        Pencil dbPencil = null;
        if(pencilPage.getId() != null){
            dbPencil = getRepository().findOne(pencilPage.getId());
            sendOrChange = dbPencil != null;//更新数据
        }
        Pencil pencil = save(pencilPage);

        //4.更新缓存,推送消息数据
        if(pencil != null && sendOrChange){

            String[] touser_db = dbPencil.getTouser().split(",");
            String[] touser_save = pencil.getTouser().split(",");
            Arrays.sort(touser_db);
            Arrays.sort(touser_save);

            if(false == Arrays.equals(touser_db, touser_save)) {//通知人不一致
                PencilPojoMsg pencilPojoMsg = new PencilPojoMsg();
                pencilPojoMsg.setPencil(pencil);
                pencilPojoMsg.setTouser_db(touser_db);
                pencilPojoMsg.setTouser_save(touser_save);

                SubscriberManagerImpl.homeWatched.setData(pencilPojoMsg);
            }
        }else if(pencil != null && sendOrChange == false){//创建时才执行推送
            SubscriberManagerImpl.homeWatched.setData(pencil);
        }

        return pencil;
    }

    @Override
    public Page<Pencil> findAllByTouserId(Long touserid, Map mp, Pageable pageable) {
//        Specification specification = createSpecification(mp);//后续需要完成复合查询
        if(mp == null || mp.get("bt") == null ){
            mp = new HashMap();
            mp.put("bt","%%");
        }

        Page<Pencil> pencilPage = getRepository().getPencilByTouserId(touserid, pageable);
        return pencilPage;
    }

    @Override
    public Page<Pencil> findAll(Map mp, Pageable pageable) {
        Specification specification = createSpecification(mp);

        return getRepository().findAll(specification, pageable);
    }

    @Transactional
    public Pencil save(PencilPage pencilPage) throws CloneNotSupportedException, IOException, JpegProcessingException {

        //1.保存主数据
        Pencil pencil = pencilPage.getPencil();
        pencil = super.getRepository().save(pencil);
//        System.out.println(pencil);

        //2. 保存通知人员信息
        String[] tousers = null;
        if(pencilPage.getTouser().equals("")){//未选择通知人则通知全员
            tousers = ListVoToString(hrmresourceService.findByDDC());
        }else{
            tousers = pencilPage.getTouser().split(",");
        }

        List<Touser> touserList = touserService.findByPencilId(pencil.getId());
        if(touserList.size() >0) {
            for(Touser touser:touserList) {
                touserService.delete(touser.getId());
            }
        }
        touserList = new ArrayList();

        Touser touser = null;
        for(String loginid:tousers){
            touser = new Touser();
//            touser.setTouser(systemCommon.getUserInfo(loginid).getId());
            touser.setTouser(Long.valueOf(loginid));
            touser.setLastname(systemCommon.getUserInfoById(Long.valueOf(loginid)).getLastname());
            touser.setPencilid(pencil.getId());
            touserList.add(touser);
        }

        touserList = (List)touserService.save(touserList);

        //3.保存图片数据
        /*
        if(pencilPage.getUpFile() !=null && pencilPage.getUpFile().length >0) {
            List<PencilImg> pencilImgList = new ArrayList();

            PencilImg pencilImg = null;
            for (MultipartFile uploadFile : pencilPage.getUpFile()) {
                pencilImg = new PencilImg();

                pencilImg.setImgdata(
                        uploadFile.getBytes()
//                    SystemCommon.convertStreamToString(uploadFile.getInputStream())
                );

                pencilImg.setRotate(systemCommon.getImgRotate(pencilImg.getImgdata()));

                pencilImg.setPencilid(pencil.getId());
                pencilImgList.add(pencilImg);

            }
            pencilImgList = (List)pencilImgService.save(pencilImgList);
        }
        */
        if(pencilPage.getImageDataId() != null && pencilPage.getImageDataId().size() >0) {
            List<PencilImg> pencilImgList = new ArrayList();

            PencilImg pencilImg = null;
            for (String id : pencilPage.getImageDataId()) {
//                System.out.println("IMG_id:" + id);
                pencilImg = new PencilImg();

                pencilImg.setImgdata(
                        pencilImgService.getCache(id).getImgdata().getBytes()
//                        uploadFile.getBytes()
//                    SystemCommon.convertStreamToString(uploadFile.getInputStream())
                );

//                pencilImg.setRotate(systemCommon.getImgRotate(pencilImg.getImgdata()));
                pencilImg.setRotate(pencilImgService.getCache(id).getRotate());

                pencilImg.setPencilid(pencil.getId());
                pencilImgList.add(pencilImg);
            }
            pencilImgList = (List)pencilImgService.save(pencilImgList);
        }
        return pencil;
    }

    /**
     * list 转字符串数组
     * @param li
     * @return
     */
    private String[] ListVoToString(List<Hrmresource> li){
        String[] rtnStr = new String[li.size()];
        int i =0;
        for(Hrmresource hrmresource:li){
            rtnStr[i++] = hrmresource.getLoginid();
        }
        return rtnStr;
    }

    private Specification createSpecification(Map mp){
        return new Specification<Transaction>() {
            @Override
            public Predicate toPredicate(Root<Transaction> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                Predicate p2 = null;//=cb.equal(root.get("bt").as(Integer.class), "");

                if(mp != null) {
                    Iterator it = mp.keySet().iterator();
                    while (it.hasNext()) {
                        String keyname = (String) it.next();

                        Expression<String> x = root.get(keyname).as(String.class);
                        String val = "%"+mp.get(keyname).toString()+"%";

                        if (p2 == null) {
                            p2 = cb.like(x, val);
                        } else {
                            p2 = cb.and(p2, cb.like(x, val));
                        }
                    }
                }
                return p2;
            }
        };
    }
}
