rmdir /S /Q dist
python setup.py sdist 
twine upload dist/*
pip wheel . -w ./dist/
pip install sparksafedelta --upgrade