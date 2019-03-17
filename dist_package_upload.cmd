rmdir /S /Q dist
python setup.py sdist 
pip wheel . -w ./dist/
twine upload dist/*
pip install sparksafedelta --upgrade