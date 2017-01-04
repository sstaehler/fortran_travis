program hello_world

  use ftnunit,                     only: runtests_init, runtests, runtests_final
  use unit_tests,                  only: test_all

  call runtests_init
  call runtests( test_all )
  call runtests_final

end program
