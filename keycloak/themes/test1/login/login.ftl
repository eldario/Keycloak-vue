<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
        <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet"/>
        <link href="${url.resourcesPath}/img/favicon.png" rel="icon"/>
        <script>
            function togglePassword() {
                var x = document.getElementById("password");
                var v = document.getElementById("vi");
                if (x.type === "password") {
                    x.type = "text";
                    v.src = "${url.resourcesPath}/img/eye.png";
                } else {
                    x.type = "password";
                    v.src = "${url.resourcesPath}/img/eye-off.png";
                }
            }
        </script>
    <#elseif section = "form">
        <div>
            <img class="logo" src="${url.resourcesPath}/img/logo.svg" alt="Avtocod">
        </div>
        <div class="box-container">
        <#if realm.password>
            <div class="callback-form">
                <h3 class="callback-form__title">Авторизация</h3>
                <form accept-charset="UTF-8" class="callback-form__form" id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                    <div class="row"><div class="col-12 col-sm-8 col-md-6 offset-sm-2 offset-md-3">
                            <div class="w100">
                                <input name="username" type="email" placeholder="${msg("username")}" value="" class="callback-form__field callback-form__field--error">
                                <div class="callback-form-error mb-3" style="height: auto;">Email указан некорректно</div>
                            </div>
                            <div class="w100 page-login__password">
                                <input name="password" placeholder="${msg("password")}" type="password" class="callback-form__field callback-form__field--error">
                                <svg viewBox="0 0 10 16" class="vue-toggle-password">
                                    <path d="M5.34785 15.1429C7.74911 15.1429 9.69571 13.1963 9.69571 10.7951C9.69571 8.3938 7.74911 6.4472 5.34785 6.4472C2.9466 6.4472 1 8.3938 1 10.7951C1 13.1963 2.9466 15.1429 5.34785 15.1429Z" stroke="currentColor" stroke-width="0.5" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path> <path d="M2.24223 7.75778V3.96273C2.24223 2.24843 3.63355 0.857117 5.34784 0.857117C6.20499 0.857117 6.98142 1.20495 7.54664 1.76396C8.10565 2.32918 8.45345 3.10558 8.45345 3.96273V7.75778" stroke="currentColor" stroke-width="0.5" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path> <path d="M5.34785 10.7951V12.0373" stroke="currentColor" stroke-width="0.5" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path> <path d="M5.34785 11.1056C5.8624 11.1056 6.27953 10.6885 6.27953 10.1739C6.27953 9.65938 5.8624 9.24225 5.34785 9.24225C4.8333 9.24225 4.41617 9.65938 4.41617 10.1739C4.41617 10.6885 4.8333 11.1056 5.34785 11.1056Z" fill="currentColor">
                                    </path>
                                </svg>
                            </div>
                        </div>
                    </div>
                    <div class="callback-form__bottom row">
                        <div class="text-center col-12">
                            <button type="submit" disabled="disabled" class="callback-form__submit-button">${msg("doLogIn")}</button>
                        </div>
                    </div>
                    <div class="callback-form__acc login-links">
                        <p>
                            <a href="https://avtocod.ru/password/reset" class="pr10">Забыли пароль?</a>
                            <a href="https://avtocod.ru/auth/registration" class="pl10">Зарегистрироваться</a>
                        </p>
                    </div>
                    <input type="hidden" name="_token" value="3sUrSZwNd1CrtDT8ydbcYcrf9IHPgF9N2e2Iuiem">
                </form>
                <div class="feedback-sent-msg">
                    <div class="feedback-sent-msg__title">
                        Вы успешно авторизизовались на портале.
                    </div>
                    <div class="feedback-sent-msg__img">
                        <img src="https://avtocod.ru/assets/frontend/img/form-sent.png" alt="">
                    </div>
                </div>
            </div>
        </#if>
        <#if social.providers??>
            <p class="para">${msg("selectAlternative")}</p>
            <div id="social-providers">
                <#list social.providers as p>
                <input class="social-link-style" type="button" onclick="location.href='${p.loginUrl}';" value="${p.displayName}"/>
                </#list>
            </div>
        </#if>
        <div>
            <p class="copyright">&copy; ${msg("copyright", "${.now?string('yyyy')}")}</p>
        </div>
    </#if>
</@layout.registrationLayout>
