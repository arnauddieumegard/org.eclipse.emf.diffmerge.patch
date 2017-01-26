/*******************************************************************************
 * Copyright (c) 2016-2017, Thales Global Services S.A.S.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Abel Hegedus, Tamas Borbas, Peter Lunk, Daniel Segesdi (IncQuery Labs Ltd.) - initial API and implementation
 *******************************************************************************/
package org.eclipse.emf.diffmerge.patch.api.filters

import org.eclipse.emf.diffmerge.patch.api.ComplexMPEFilterType
import org.eclipse.emf.diffmerge.patch.api.IModelPatchEntryFilter
import org.eclipse.emf.diffmerge.patch.api.ModelPatchEntry
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

import static com.google.common.base.Preconditions.*

class ComplexEntryFilter implements IModelPatchEntryFilter {
  @Accessors(PUBLIC_GETTER)
  private ComplexMPEFilterType type
  @Accessors(PUBLIC_GETTER)
  private List<IModelPatchEntryFilter> subFilters

  new(ComplexMPEFilterType type, IModelPatchEntryFilter... subFilters) {
    checkNotNull(type)
    checkNotNull(subFilters)
    this.type = type
    this.subFilters = subFilters
  }

  override isEntryFiltered(ModelPatchEntry entry) {
    if(type==ComplexMPEFilterType.OR) {
      return subFilters.exists[it.isEntryFiltered(entry)]
    } else {
      return subFilters.forall[it.isEntryFiltered(entry)]
    }
  }

}
