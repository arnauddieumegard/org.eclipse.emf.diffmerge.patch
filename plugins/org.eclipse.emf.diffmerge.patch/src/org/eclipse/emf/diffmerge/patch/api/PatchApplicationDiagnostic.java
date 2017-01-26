/*******************************************************************************
 * Copyright (c) 2016-2017 Thales Global Services S.A.S.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Abel Hegedus, Tamas Borbas, Peter Lunk, Daniel Segesdi (IncQuery Labs Ltd.) - initial API and implementation
 *******************************************************************************/
package org.eclipse.emf.diffmerge.patch.api;

import java.util.ArrayList;
import java.util.List;

public class PatchApplicationDiagnostic {
    private List<ModelPatchDiagnosticElement> diagnosticElements = new ArrayList<ModelPatchDiagnosticElement>();

    public void addElement(ModelPatchDiagnosticElement element) {
        diagnosticElements.add(element);
    }

    public List<ModelPatchDiagnosticElement> getDiagnosticElements() {
        return diagnosticElements;
    }

    public int numOfExceptions() {
        return diagnosticElements.size();
    }
}
