#!/bin/bash
#To Debug
#CIRCLE_BRANCH=`echo "$1" | xargs`

DEV_ENV_LIST=(
    "FIREBASE_API_KEY=34567iknbvcse5678iknbvfrt83247zewka"
    "FIREBASE_APP_ID=234578olsmvcxswe56789plmnbvcrt67i"
    "FIREBASE_APP_DOMAIN_URL=asd-development-app"
)

QA_ENV_LIST=(
    "FIREBASE_API_KEY=lkjhgfdsawertzujnbvfde3456787654"
    "FIREBASE_APP_ID=12qasedxse45trz65edfghutzui876z7i"
    "FIREBASE_APP_DOMAIN_URL=asd-qa-app"
)

PROD_ENV_LIST=(
    "FIREBASE_API_KEY=kiuzgjzght8i7zuik32nhi87uij423ui"
    "FIREBASE_APP_ID=987zu987zhji876tz765redft54esdft5"
    "FIREBASE_APP_DOMAIN_URL=asd-production-app"
)

setEnvironmentVariablesToBashContext() {
    local envArr=("$@")
    for variable in ${envArr[@]}
    do
        echo "export $variable" 2>&1 | tee -a $BASH_ENV
    done
}

echo "Branch: $CIRCLE_BRANCH"

if [ "$CIRCLE_BRANCH" == "develop" ]
then
    echo "Set PROD_ENV_LIST:"
    setEnvironmentVariablesToBashContext ${PROD_ENV_LIST[@]}

elif [ "$CIRCLE_BRANCH" == "qa" ]
then
    echo "Set QA_ENV_LIST:"
    setEnvironmentVariablesToBashContext ${QA_ENV_LIST[@]}
elif [[ "$CIRCLE_BRANCH" == *"feature/"* ]]
then
    echo "Set DEV_ENV_LIST:"
    setEnvironmentVariablesToBashContext ${DEV_ENV_LIST[@]}
else
    echo "Skip set environment variables due to branch $CIRCLE_BRANCH ..."
fi

