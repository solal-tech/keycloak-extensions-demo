<#import "template.ftl" as layout>
<#import "components/button.ftl" as button>
<#import "components/button-group.ftl" as buttonGroup>
<#import "components/form.ftl" as form>
<#import "components/input.ftl" as input>
<#import "components/link.ftl" as link>

<#assign mobilePhoneLabel>
	<#compress>
		${msg("updateMobileFieldLabel")}
	</#compress>
</#assign>


<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('mobile_number'); section>
    <#if section = "header">
        ${msg("updateMobileTitle")}
    <#elseif section = "form">
				<div class="prose">
					<div class="headings:h2 text-gray-500 mb-4">${msg("requiredPhoneInfo")}</div>
				</div>
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
				<div class="text-solal-primary-600">
					${msg("updateMobileText")}
				</div>
		<#elseif section="nav">
			<@link.kw color="secondary" href=url.loginUrl size="small">
				${kcSanitize(msg("backToLogin"))?no_esc}
			</@link.kw>
    </#if>
</@layout.registrationLayout>
