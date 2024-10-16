# Conference-IBPC2024-UMCF-Case



# How much computational complexity is necessary to model relevant aspects in microclimate urban physics?


# Abstract

Significant advances in microclimate modeling tools range from no coupling to fully coupled urban physics, requiring a trade-off between simulation speed and accuracy. In this study, we validated the "urbanMicroclimate-Foam" solver for accuracy, an essential step for ensuring reliable modeling enhancements. This involved creating a detailed 3D model and conducting transient simulations, with results compared to weather data collected from on-site weather stations at Georgia Tech. Our future aim is to integrate this approach into the Eddy3D toolkit, enhancing its HAM and VEG modules for microclimate modeling. The results demonstrate the effectiveness and versatility of these methods in various scenarios and complex modeling tasks, contributing to advancing urban climate modeling. This work supports informed decision-making on the urban heat island effect and urban sustainability.

# Keywords

```Urban Micro-climate, urban heat island, CFD, Urban building energy modeling```

# Author

- Name: [Sina Rahimi](mailto:sina.rahimi@torontomu.ca)
- LinkedIn: [Link](https://www.linkedin.com/in/sinarahimi2020/)
- Institution: Toronto Metropolitan University
- Program: PhD Building Science
- Advisors: Dr. Umberto Berardi, Dr. Patrick Kastner

#Repository Structure

- ```case/```: Directory containing the case study used in the research.
- ```case set up/```: Directory containing the steps on how to set up the case study used in the research.
- ```Dockerfile/```: Directory containing steps on how to compile the solver in Docker.
- ```analyze_docker_image/```: Directory containing how to run the solver in Docker.

# Instructions for running the case


1-      **Compile the solver**

**Steps to compile the updated solver**

Clone the repository to any place you want using the
the following command:

```console
git clone https://gitlab.ethz.ch/openfoam-cbp/solvers/urbanmicroclimatefoam.git
cd urbanmicroclimatefoam
git checkout tags/of-org_v8.0
./Allwmake

```

You are done. After that, you can use the updated *buoyantHumidityPimpleFoam* solver.

2-      **Run the test case**

Clone the repository to any place you want using the
the following command:

```console
@-: git clone https://github.com/SustainableUrbanSystemsLab/CP-IBPC2024-UMCF-Case/tree/main/case.git
```

After that, load your OpenFOAM environment (if it has not already happened) and move it into the repository. Here, check your version you want:

```console
@~: git checkout OpenFOAM-v8  
```
```console
@~: Allprepare
@~: Allrun
```

Note that you can change the mesh settings by changing the parameters of sanppyhexmeshDict in the system folder.

# Citation

```console
@confpaper{
  title = {Assessing the Complexity Required for Enhancing Ed-dy3D: Validation of urbanMicroclimateFoam for Urban Heat Island Mitigation},
  author = {Rahimi, Sina},
  year = {2024},
  school = {Toronto Metropolitan University},
  type = {Conference Paper}
}
```
# Source

[Link](https://github.com/SustainableUrbanSystemsLab/CP-IBPC2024-UMCF-Case/tree/main) to this repository.
