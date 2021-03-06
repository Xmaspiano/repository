package com.asiagroup.util.shiro;

import com.asiagroup.system.entity.Hrmresource;
import com.asiagroup.system.service.HrmresourceService;
import com.asiagroup.util.SystemCommon;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.Set;

/**
 * <p>User: Zhang Kaitao
 * <p>Date: 14-1-28
 * <p>Version: 1.0
 */
public class UserRealm extends AuthorizingRealm {

//    @Autowired
//    private HrmresourceService userService;

    @Autowired
    private SystemCommon systemCommon;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String username = (String)principals.getPrimaryPrincipal();

        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
//        authorizationInfo.setRoles(relationshipUserRoleService.findRoles(username));
        Set<String> roles = new HashSet<String>();
//        roles.add("user:save:add");
        roles.add("user");
        roles.add("menu");
        roles.add("role");
        roles.add("resources");
        roles.add("dept");
//        roles.add("role:save:add");
        authorizationInfo.setStringPermissions(roles);
        return authorizationInfo;
    }


    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

        String username = (String)token.getPrincipal();

        Hrmresource user = systemCommon.getUserInfo(username);

        if(user == null) {
            throw new UnknownAccountException("没找到帐号");//没找到帐号
        }

//        if(Boolean.TRUE.equals(user.getLocked())) {
//            throw new LockedAccountException(); //帐号锁定
//        }

        //交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配，如果觉得人家的不好可以自定义实现
        SimpleAuthenticationInfo authenticationInfo = null;
        try {
            authenticationInfo = new SimpleAuthenticationInfo(
                    user.getLoginid(), //用户名
                    user.getPassword(), //密码
                    getName()  //realm name
            );
        }catch(AuthenticationException ae){
            throw new AuthenticationException("用户名或密码错误!");
        }
        return authenticationInfo;
    }

    @Override
    public void clearCachedAuthorizationInfo(PrincipalCollection principals) {
        super.clearCachedAuthorizationInfo(principals);
    }

    @Override
    public void clearCachedAuthenticationInfo(PrincipalCollection principals) {
        super.clearCachedAuthenticationInfo(principals);
    }

    @Override
    public void clearCache(PrincipalCollection principals) {
        super.clearCache(principals);
    }

    public void clearAllCachedAuthorizationInfo() {
        getAuthorizationCache().clear();
    }

    public void clearAllCachedAuthenticationInfo() {
        getAuthenticationCache().clear();
    }

    public void clearAllCache() {
        clearAllCachedAuthenticationInfo();
        clearAllCachedAuthorizationInfo();
    }

}
