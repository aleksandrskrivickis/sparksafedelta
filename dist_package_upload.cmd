rmdir /S /Q dist
python setup.py sdist 
python setup.py bdist_wheel
twine upload dist/*
pip install sparksafedelta --upgrade