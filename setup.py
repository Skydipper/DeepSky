import os
import re
import setuptools

envstring = lambda var: os.environ.get(var) or ""

try:
    with open("README.md", "r") as fh:
        long_description = fh.read()
except:
    long_description = ""

if os.path.isfile("variables"):
    try:
        with open("variables", "r") as fh:
            variables = fh.read().strip().split("\n")
        for v in variables:
            key, value = v.split("=")
            os.environ[key] = re.sub("['\"]", "", value)
    except:
        pass

setuptools.setup(
    name=envstring("NAME"),
    version=envstring("VERSION"),
    author=envstring("AUTHOR"),
    author_email=envstring("AUTHOR_EMAIL"),
    description=envstring("DESCRIPTION"),
    url=envstring("URL"),
    license='MIT',
    long_description=long_description,
    long_description_content_type="text/markdown",
    packages=[envstring("NAME")],
    install_requires=[
        'earthengine-api==0.1.273',
        'folium==0.8.3',
        'geojson==2.5.0',
        'geopandas==0.7.0',
        'google-api-core==1.21.0',
        'google-api-python-client==1.12.1',
        'google-auth==1.18.0',
        'google-auth-httplib2==0.0.3',
        'google-auth-oauthlib==0.4.1',
        'google-cloud-core==1.3.0',
        'google-cloud-storage==1.25.0',
        'google-pasta==0.1.8',
        'google-resumable-media==0.5.0',
        'googleapis-common-protos==1.51.0',
        'Keras-Applications==1.0.8',
        'Keras-Preprocessing==1.1.0',
        'oauth2client==4.1.3',
        'pandas==1.0.0',
        'protobuf==3.12.0',
        'SQLAlchemy==1.3.13',
        'psycopg2==2.8.4',
        'qtconsole==4.6.0',
        'requests==2.22.0',
        'scikit-learn==0.21.3',
        'Skydipper-sdk==1.0.0',
        'tensorboard==2.1.1',
        'tensorflow==2.5.3',
        'tensorflow-estimator==2.1.0',
        'python-dotenv==0.18.0'
    ],
    classifiers=[
        "Operating System :: POSIX :: Linux",
        "License :: OSI Approved :: MIT License",
        'Programming Language :: Python :: 3.5',
        'Programming Language :: Python :: 3.6',
        'Programming Language :: Python :: 3.7',
        'Programming Language :: Python :: 3.8',
    ],
)