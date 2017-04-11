<div id="header">
    <div>
        <a id="logo_a" href="/yo-party-net/home.shtml"> <img class="logo" src="/yo-party-net/images/logo.png" width="55.62" height="55.62" alt="">
            <p class="masthead-brand">友派</p></a>

        <ul class="navigation">
            <li>
                <a href="/yo-party-net/home.shtml">首页</a>
            </li>
            <li>
                <a href="/yo-party-net/event/list.shtml">活动</a>
            </li>
            <li>
                <a href="/yo-party-net/home.shtml">关于</a>
            </li>
        </ul>


    <#if isLogin>
    <ul class="login hd-hidden">
    <#else >
    <ul class="login ">
    </#if>
        <li>
            <a href="/yo-party-net/login.shtml">登录</a>
        </li>
        <li>
            <a href="/yo-party-net/register/register.shtml">注册</a>
        </li>
    </ul>


    <#if isLogin>
        <ul class="info ">
            <li><a id="loginUnmae" href="/yo-party-net/event_order/list.shtml">${username}</a></li>
            <#if ifLeader>
                <li id="imleader"><a href="/yo-party/index.shtml" target="_blank">我是领队</a></li>
            </#if>
                <li><a href="/yo-party-net/logout">注销</a></li>
        </ul>
        <input type="hidden" id="loginUid" value="${loginUid}"/>
    <#else >
        <ul class="info hd-hidden">
            <li><a id="loginUnmae" href="/yo-party-net/event_order/list.shtml"></a></li>
            <li id="imleader"><a href="/yo-party/index.shtml" target="_blank">我是领队</a></li>
            <li><a href="/yo-party-net/logout">注销</a></li>
        </ul>
        <input type="hidden" id="loginUid" value=""/>
    </#if>

    </div>
</div>
<div id="hdline"></div>
