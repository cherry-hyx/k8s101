#!/bin/bash

create_accounts=($@)

token_file=/var/lib/kube-apiserver/known_tokens.csv

touch ${token_file}
for account in ${create_accounts[@]} ; do
  if grep ",${account}," ${token_file} ; then
    continue
  fi

  # more details: http://kubernetes.io/docs/admin/authentication/
  # token,user,uid,"group1,group2,group3"

  token=$(dd if=/dev/urandom bs=128 count=1 2>/dev/null | base64 | tr -d "=+/" | dd bs=32 count=1 2>/dev/null)
  echo ${token},${account},${account} >> ${token_file}
  echo Added ${account}
done

