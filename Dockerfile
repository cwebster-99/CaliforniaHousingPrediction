FROM jupyter/minimal-notebook

# Set arguments
ARG CONTAINER_USER=jovyan
ARG GIT_URI=https://github.com/minsa110/CaliforniaHousingPrediction
ARG REPO_DIR=repo

# Clone repo
USER ${CONTAINER_USER}
RUN \
    echo "*** cloning repo ${GIT_URI} ***" && \
    git clone --single-branch ${GIT_URI} /home/${CONTAINER_USER}/${REPO_DIR}

# Install libraries
RUN \
    echo "*** install libraries ***" && \
    pip3 install -r "/home/${CONTAINER_USER}/${REPO_DIR}/requirements.txt"

# Start up the notebook
USER ${CONTAINER_USER}
COPY --chown=${CONTAINER_USER} run_script /home/${CONTAINER_USER}
RUN \
    echo "*** start notebook ***" && \
    chmod +x ./run_script
CMD ["./run_script"]