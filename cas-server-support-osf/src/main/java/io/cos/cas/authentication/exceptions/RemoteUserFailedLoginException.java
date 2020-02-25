/*
 * Copyright (c) 2020. Center for Open Science
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package io.cos.cas.authentication.exceptions;

import javax.security.auth.login.AccountException;

/**
 * Describes an error condition where authentication has failed during institutional authentication delegation.
 *
 * TODO: Divide this exception into two or more detailed ones. For example, one for failure in parsing required
 *       attributes from authenticated Shibboleth session (InstitutionLoginFailedException), one for failure in
 *       communicating with OSF API (OsfApiFailedException), etc.
 *
 * @author Michael Haselton
 * @author Longze Chen
 * @since 20.1.0
 */
public class RemoteUserFailedLoginException extends AccountException {

    private static final long serialVersionUID = 3472948140572518658L;

    /** Instantiates a new exception (default). */
    public RemoteUserFailedLoginException() {
        super();
    }

    /**
     * Instantiates a new exception with a given message.
     *
     * @param message the message
     */
    public RemoteUserFailedLoginException(final String message) {
        super(message);
    }
}
