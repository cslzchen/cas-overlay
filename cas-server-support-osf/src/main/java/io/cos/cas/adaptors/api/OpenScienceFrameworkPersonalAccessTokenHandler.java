/*
 * Licensed to Jasig under one or more contributor license
 * agreements. See the NOTICE file distributed with this work
 * for additional information regarding copyright ownership.
 * Jasig licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file
 * except in compliance with the License.  You may obtain a
 * copy of the License at the following location:
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package io.cos.cas.adaptors.api;

import org.jasig.cas.support.oauth.personal.PersonalAccessToken;
import org.jasig.cas.support.oauth.personal.handler.support.AbstractPersonalAccessTokenHandler;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;

import javax.validation.constraints.NotNull;
import java.util.Arrays;
import java.util.HashSet;

/**
 * The Open Science FrameWork API OAuth2 Personal Access Token Handler.
 *
 * @author Michael Haselton
 * @author Longze Chen
 * @since 4.1.0
 */
public class OpenScienceFrameworkPersonalAccessTokenHandler extends AbstractPersonalAccessTokenHandler
        implements InitializingBean {

    private static final Logger LOGGER = LoggerFactory.getLogger(OpenScienceFrameworkPersonalAccessTokenHandler.class);

    /** The Open Science Framework API CAS Endpoint instance. */
    @NotNull
    private OpenScienceFrameworkApiCasEndpoint osfApiCasEndpoint;

    /** Default Constructor. */
    public OpenScienceFrameworkPersonalAccessTokenHandler() {}

    @Override
    public void afterPropertiesSet() throws Exception {
    }

    @Override
    public PersonalAccessToken getToken(final String tokenId) {

        final JSONObject data = new JSONObject();
        data.put("tokenId", tokenId);

        // encrypt the payload using JWE/JWT
        final String encryptedPayload = osfApiCasEndpoint.encryptPayload("data", data.toString());

        // talk to API `/cas/service/pat/` endpoint
        final JSONObject response = osfApiCasEndpoint.apiCasService("pat", encryptedPayload);
        if (response == null || !response.has("ownerId") || !response.has("tokenScopes")) {
            LOGGER.error("Invalid Response");
            return null;
        }

        final String ownerGuid = (String) response.get("ownerId");
        final String tokenScopes = (String) response.get("tokenScopes");

        return new PersonalAccessToken(
            tokenId,
            ownerGuid,
            new HashSet<>(Arrays.asList(tokenScopes.split(" ")))
        );
    }

    public void setOsfApiCasEndpoint(final OpenScienceFrameworkApiCasEndpoint osfApiCasEndpoint) {
        this.osfApiCasEndpoint = osfApiCasEndpoint;
    }
}
