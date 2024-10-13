# Conference-IBPC2024-UMCF-Case



# Introduction

This document outlines the steps and modifications required for setting up and running a simulation. Adjustments to several files within different directories, including ABLConditions, U, nut, epsilon, k, and LAD files, are detailed below.

# Air Folder

## 0/air

## ABLConditions File

\- Uref: Should be set to the inlet averaged wind speed.  
\- Zref: Typically set to 10, as weather data is usually measured at 10 meters above ground.  
\- FlowDir: Depends on the location of the inlet and outlet patches in the domain.  
\- Z0: Should be referred to literature for accurate values based on the study location.

## wambient, couldCover, and Tambient

\- Adjustments should be made according to the study location.

## Patches

\- All patches in relevant files should be modified according to the patches available in the domain.  
\- Symmetry boundary condition should be used for sides (north and south) and the top of the domain.

## U, nut, epsilon, and k Files

\- ABLconditions should be included.

# Air Backup Folder

## LAD File (0/airbckp)

\- Adjustments should be made according to the ABL condition.

# Buildings Folder

No change is needed unless you want to change the temperature of the building.

# Vegetation Folder

## Internal Field Temperature

\- No changes are needed unless the internal field temperature is modified.  
\- The T file should be updated if changes are made.

# Constant Files

## Air Folder

\- No changes are needed unless thermophysical properties are modified.  
\- incompressiblePerfectGas or Boussinesq should be chosen and the file should be adjusted accordingly.

## Buildings Folder

\- _transportProperties_ and _setset.batch_ (system/buildings) files should be modified if different materials are used for buildings. For that, first the _transportProperties_ file neede to be modified add the desier material and the modifyin the _setset.batch_ file.

## TriSurface Folder

\- STL files should be placed here.

## Vegetation Folder

One of the issues that I faced during this process was dealing with the _viewFactorsDict_ file. After running the calcAl and _viewFActorGen_ command, I used to face an error which was related to this file. The error was “Dynamic list need from capacity. Actual size maxDynListLength: 100000” especially when I used to run with openFoam v6. I increaced the number of maxDynListLength in the veiwFactorsDict also on another try I increased its limitaion from the source code. But I could not address the issue unless I decreased the number of trees in my domain, and that is why the number of trees in my domain are less than the actual number of trees. It is still unclearing to me how the number of trees is related to this error. Maybe it was the the tree file (I used the exact tree which were in the tutorial) or something else. More studyies and investigation are needed to address this issue.

\- Issues with the viewFactorsDict file should be addressed.  
\- maxDynListLength should be increased if encountering the 'Dynamic list need from capacity'error.  
\- Idif IDN and sunPosVector should be adjusted according to the study location.

# System Files

## _BlockMeshDict_

\- Franke guidelines should be followed: Inlet sides and top should be 5H from buildings, and the outlet should be 15H (H = 40 meters in this study).

In the windAroundBuildings_CFDHAM_veg, I noticed that they did not follow the Franke guidelines. Beacues, they used their the boundry condition which was obtained from another model. For example, a larger scale model such as mesoscale meteorological simulations. But in the streetCanyon_CFDHAM_veg tutorial, they used atmospheric boundary layer conditions, so I modified my files according to that tutorial as I wanted to have atmospheric boundary layer conditions in my case. So, in the first step the suitable block is necessary. For that first the building bounds should be identified, then according to that identifying x min and max, y min and max, and z min and max. Xcells where the length of the box divided by 15, the same for ycells and zcells.

## _Surfacefeature_ Command

\- _surfaceFeatureDict_ should be modified to recognize tree.stl by setting includedAngle to 90.

I realized that when running “_Surfacefeature_” command it does not recognize the tree.stl. Because the boundaingbox for tree.stl was (0 0 0) (0 0 0). So, I modified the surfaceFeatureDict. In this file there is “includedAngle” which is for Identify a feature when angle between faces < includedAngle. I set it as 90 and then ran the “surfacefeature” and this time it could reconigze the tree.stl.

## _SnappyHexMeshDict_

\- A proper refinementBox should be defined around buildings. It is necessary to to find the buildings locations and the define the refinemtBox around the buildings.  
\- addLayers should be on for _SnappyHexMeshDict.air_. as a layer of mesh is needed to be added to the buildings mesh to be able to capture the heat and moisture transport.  
\- refinementRegions mode distance for buildings and trees should be modified.  
\- locationInMesh should be defined within the domain but not inside trees or buildings.

## _Setset.batch_ in system/building Folder

\- FacadesRoofs characterization should be assigned to buildings' locations within the domain.

## _ControlDict_

\- blending should be set to false if an atmospheric boundary layer is needed.

# Parallel Simulation

## _DecomposeParDict_ Files

\- Adjustments should be made according to the number of physical cores being used for the simulation.

## _Allrun_ File

\- If running in parallel, _solarRayTracingVegGen_ should be changed to _solarRayTracingGen_ on line 23.

# Conclusion

This document provides a comprehensive guide to setting up and running simulations, ensuring all necessary modifications and adjustments are clear and well-organized. For further issues, relevant literature should be consulted or additional support should be sought.
