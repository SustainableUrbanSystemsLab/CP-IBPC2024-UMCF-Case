# Use an official OpenFOAM image as the base image
FROM dicehub/openfoam:6

# Install necessary packages
USER root
RUN apt update
RUN apt install -y git


# Clone the custom solver repository
# RUN mkdir -p $FOAM_INST_DIR/customSolvers
# WORKDIR $FOAM_INST_DIR/customSolvers
RUN git clone https://gitlab.ethz.ch/openfoam-cbp/solvers/urbanmicroclimatefoam.git

# Compile the custom solver
# WORKDIR $FOAM_INST_DIR/customSolvers/customSolverRepo
RUN ./Allwmake

# Set the entrypoint to bash to keep the container running interactively
ENTRYPOINT ["/bin/bash"]
