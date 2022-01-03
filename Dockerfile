FROM jupyter/scipy-notebook:latest

#setting jupyter
RUN echo y | jupyter notebook --generate-config
RUN echo c = get_config\(\) >> ${HOME}/.jupyter/jupyter_notebook_config.py
RUN echo c.NotebookApp.ip=\'0.0.0.0\' >> ${HOME}/.jupyter/jupyter_notebook_config.py
RUN echo c.NotebookApp.port = 8080 >> ${HOME}/.jupyter/jupyter_notebook_config.py
RUN echo c.NotebookApp.token = \'${CODER_PASSWORD}\' >> ${HOME}/.jupyter/jupyter_notebook_config.py
RUN echo c.NotebookApp.allow_root = True >> ${HOME}/.jupyter/jupyter_notebook_config.py
RUN echo c.NotebookApp.open_browser = False >> ${HOME}/.jupyter/jupyter_notebook_config.py

ENTRYPOINT ["jupyter","notebook"]

