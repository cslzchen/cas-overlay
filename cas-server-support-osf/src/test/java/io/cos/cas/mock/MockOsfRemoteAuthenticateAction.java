package io.cos.cas.mock;

import io.cos.cas.AbstractTestUtils;
import io.cos.cas.authentication.OpenScienceFrameworkCredential;
import io.cos.cas.authentication.handler.support.OpenScienceFrameworkPrincipalFromRequestRemoteUserNonInteractiveCredentialsAction;
import org.jasig.cas.CentralAuthenticationService;

import javax.security.auth.login.AccountException;

/**
 * This class mocks the {@link OpenScienceFrameworkPrincipalFromRequestRemoteUserNonInteractiveCredentialsAction} class.
 *
 * @author Longze Chen
 * @since  4.1.5
 */
public class MockOsfRemoteAuthenticateAction
    extends OpenScienceFrameworkPrincipalFromRequestRemoteUserNonInteractiveCredentialsAction {

    public static final String CONST_CAS_IDENTITY_PROVIDER = "Cas-Identity-Provider";
    public static final String CONST_SHIB_IDENTITY_PROVIDER = "Shib-Identity-Provider";

    private static final String INSTITUTION_AUTH_URL = "https://institutionauth/";
    private static final String INSTITUTION_AUTH_JWE_SECRET = "osf_api_cas_login_jwe_secret_32b";
    private static final String INSTITUTION_AUTH_JWT_SECRET = "osf_api_cas_login_jwt_secret_32b";
    private static final String INSTITUTION_AUTH_XSL_LOCATION = "file:mock-institutions-auth.xsl";

    /** Constructor. */
    public MockOsfRemoteAuthenticateAction(
            final CentralAuthenticationService centralAuthenticationService
    ) {
        this.setCentralAuthenticationService(centralAuthenticationService);
        this.setInstitutionsAuthUrl(INSTITUTION_AUTH_URL);
        this.setInstitutionsAuthJweSecret(INSTITUTION_AUTH_JWE_SECRET);
        this.setInstitutionsAuthJwtSecret(INSTITUTION_AUTH_JWT_SECRET);
        this.setInstitutionsAuthXslLocation(INSTITUTION_AUTH_XSL_LOCATION);
    }

    @Override
    protected PrincipalAuthenticationResult notifyRemotePrincipalAuthenticated(
            final OpenScienceFrameworkCredential credential
    ) throws AccountException {
        return new PrincipalAuthenticationResult(AbstractTestUtils.CONST_MAIL, AbstractTestUtils.CONST_INSTITUTION_ID);
    }
}
