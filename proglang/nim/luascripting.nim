import strutils, nimLUA, os, rdstdin, unittest

discard """ proc test(L: PState, fileName: string) =
  if L.doFile("test" & DirSep & fileName) != 0.cint:
    echo L.toString(-1)
    L.pop(1)
  else:
    echo fileName & " .. OK" """

discard """ proc main() =
  var L = newNimLua()
  L.bindEnum(FRUIT, SUBATOM, GENE)
  L.test("test.lua")
  L.close()

main()
 """

type
  YesOrNo* = enum ynYES, ynNO, ynMAYBE

proc sample*() : string =
  result = "sample function called"

proc car*(car:string) =
  echo "binding new card: " & car

proc runScript*(script:string) : cint {. cdecl .} =  #, context:PState):cint  = #
  nimLuaOptions(nloDebug, true) #turn on debug
  #var context = newState()
  #luaEngine.setContext(context)
  var luaEngine = newNimLua()
  luaEngine.openLibs
  luaEngine.bindEnum(YesOrNo)
  luaEngine.bindFunction(sample)
  luaEngine.bindFunction(car)
  echo "\lrunning script : " & script
  result = luaEngine.dostring(script)
  luaEngine.close()
  echo "exit code: " & $result & "\r\n"
  #result = 0

proc runREPL(L:PState):cint {. cdecl .} =
  var luaEngine = newNimLua()
  while true:
    discard

when isMainModule:
  echo runScript("""print "hello world" """)
  echo runScript("print(sample())")
  echo runScript("""print (2*2)""")
  echo runScript("""require('math'); print (3.0*math.sqrt(2.0))""")
  echo runScript("""local a=ynYES;  print("T1", YesOrNo.ynYES);     print("T2", YesOrNo.ynNO); print("T3", YesOrNo.ynMAYBE)
  print("T4", YesOrNo)
  print(car("fancyCar"))
   """)

