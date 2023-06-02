<#import "template.ftl" as layout>
<#import "components/button.ftl" as button>
<#import "components/button-group.ftl" as buttonGroup>
<#import "components/form.ftl" as form>
<#import "components/input.ftl" as input>
<#import "components/link.ftl" as link>
<#assign mobilePhoneLabel>
    <#macro kw>
        <#compress>
					${msg("updateMobileFieldLabel")}
        </#compress>
    </#macro>

</#assign>


<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('mobile_number'); section>
    <#if section = "header">
        ${msg("updateMobileTitle")}
    <#elseif section = "form">
			<h2>${msg("updateMobileHello",(username!''))}</h2>
			<p>${msg("updateMobileText")}</p>
        <@form.kw action=url.loginAction method="post">
            <@input.kw
            autofocus=true
            invalid=messagesPerField.existsError("mobile_number")
            label=mobilePhoneLabel
            message=kcSanitize(messagesPerField.get("mobile_number"))
            name="mobile_number"
            type="text"
            value=mobile_number
            />
            <@buttonGroup.kw>
                <@button.kw color="primary" type="submit">
                    ${msg("doSubmit")}
                </@button.kw>
            </@buttonGroup.kw>
        </@form.kw>
    <#elseif section="info">
        ${msg("updateMobileText")}
		<#elseif section="nav">
			<@link.kw color="secondary" href=url.loginUrl size="small">
				${kcSanitize(msg("backToLogin"))?no_esc}
			</@link.kw>
    </#if>
</@layout.registrationLayout>
