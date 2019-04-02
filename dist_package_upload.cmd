@echo Version increment example:
@echo 0.0.0 major.minor.patch.
@echo 1)major
@echo 2)minor
@echo 3)patch
@echo\

set /p version_increment_type="Please select version increment type index: "

@echo Deleting dist directory
rmdir /S /Q dist


@echo Incrementing version
IF [%version_increment_type%] EQU [1] (
    echo "Major version increment selected"
    bumpversion --allow-dirty major setup.py

)
IF [%version_increment_type%] EQU [2] (
    echo echo "Minor version increment selected"
    bumpversion --allow-dirty minor setup.py

)
IF [%version_increment_type%] EQU [3] (
    echo "Patch version increment selected"
    bumpversion --allow-dirty patch setup.py
)



@echo Creating package
python setup.py sdist

@echo Uploading package
twine upload -u aleksandrsk1 dist/*

@echo Automatic git push
git add --all
git commit -m "Automated push"
git push

@echo Creating wheel
pip wheel . -w ./dist/

@echo Installing package
pip --no-cache-dir install sparksafedelta --upgrade