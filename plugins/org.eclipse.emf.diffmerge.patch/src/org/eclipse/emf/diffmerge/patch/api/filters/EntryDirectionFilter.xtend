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

import org.eclipse.emf.diffmerge.patch.api.IModelPatchEntryFilter
import org.eclipse.emf.diffmerge.patch.api.ModelPatchEntry
import org.eclipse.emf.diffmerge.patch.api.ChangeDirection
import org.eclipse.xtend.lib.annotations.Accessors

import static com.google.common.base.Preconditions.*

class EntryDirectionFilter implements IModelPatchEntryFilter {
  @Accessors(PUBLIC_GETTER)
  private ChangeDirection filteredDirection

  new(ChangeDirection filteredDirection) {
    checkNotNull(filteredDirection)
    this.filteredDirection=filteredDirection
  }

  override isEntryFiltered(ModelPatchEntry entry) {
    return entry.direction==filteredDirection
  }

}
