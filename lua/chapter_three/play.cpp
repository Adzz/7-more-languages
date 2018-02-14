extern "C"

{
  #include "lua.h"
  #include "luaxlib.h"
  #include "lualib.h"
}

int main(int argc, const char* argv[])
{
  lua_State* L = luaL_newstate();
  luaL_openlibs(L);

  lualL_dostring(L, "print('Hi')");

  lua_close(L);

  return 0;
}
