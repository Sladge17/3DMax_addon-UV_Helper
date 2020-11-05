macroScript UV_Helper
category:"SM_Tools"
toolTip:"UV_Helper"
(
for i in $ do 
(
ResetXForm (i)
)
macros.run "Modifier Stack" "Convert_to_Poly"

CenterPivot($)
WorldAlignPivot($)

for i in $ do
(	
addModifier i (Uvwmap ())
i.modifiers[#UVW_Map].mapChannel = 1
i.modifiers[#UVW_Map].maptype = 4
i.modifiers[#UVW_Map].length = 100
i.modifiers[#UVW_Map].width = 100
i.modifiers[#UVW_Map].height = 100

i.pivot.z=i.min[3]
)

modPanel.addModToSelection (Unwrap_UVW ()) ui:on
for i in $ do
(
addModifier i (Unwrap_UVW ())
i.modifiers[#unwrap_uvw].unwrap.setMapChannel 2
subobjectLevel = 3
actionMan.executeAction 0 "40021"
i.modifiers[#unwrap_uvw].setFlattenAngle(45)
i.modifiers[#unwrap_uvw].setFlattenSpacing(0.01)
i.modifiers[#unwrap_uvw].setFlattenNormalize(true)
i.modifiers[#unwrap_uvw].setFlattenRotate(true)
i.modifiers[#unwrap_uvw].setFlattenFillHoles(true)
i.modifiers[#unwrap_uvw].flattenMapNoParams()
)

macros.run "Modifier Stack" "Convert_to_Mesh"
macros.run "Modifier Stack" "Convert_to_Poly"
)