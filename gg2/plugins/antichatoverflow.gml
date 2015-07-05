globalvar odushashasha, is, a, shitty, map, _;
_ = id;

global.chatLog = -1;

_gay =    1<<7;
_usa =    1<<6;
_cok =    1<<5;
_bal =    1<<4;
_sem =    1<<3;
_sos =    1<<2;
_pen =    1<<1;
_ass =    1<<0;

_._dik =  _gay|
          _usa|
          _cok|
          _bal|
          _sem|
          _sos|
          _pen|
          _ass;

_red =    _dik
          >>7
          >>6
          >>5
          >>4
          >>3
          >>2
          >>1
          ;
          
_coc =    string(1<<6|1<<3);
_moo =    string(1<<6|1<<0);
_cow =    string(1<<6|1<<3|1<<1);
_dog =    string(1<<6|1<<3|1<<1|1<<0);
_hay =    string(1<<6|1<<3);
_blu =    string('6e');
_eye =    string(1<<4|1<<2);
_pls =    string(1<<5|1<<4|1<<1);
_icy =    string('6c');
_plz =    string(1<<5|1<<4|1<<3|1<<2|1<<0);
_fml =    string(1<<6|1<<3|1<<2|1<<1|1<<0);
_win =    string(1<<6|1<<0);
_pie =    string(1<<6|1<<3);
_lol =    string(1<<5|1<<3|1<<1|1<<0);
_rok =    string('6f');
_man =    string('6e');
_fuk =    string(1<<6|1<<3|1<<1);
_omg =    string(1<<6|1<<3);
_asl =    string('6f');
_car =    string('6c');

_ice =    unhex(_coc)
          +
          unhex(_moo)
          +
          unhex(_cow)
          +
          unhex(_dog)
          +
          unhex(_hay)
          +
          unhex(_blu)
          +
          unhex(_eye)
          +
          unhex(_pls)
          +
          unhex(_icy)
          +
          unhex(_plz)
          +
          unhex(_fml)
          +
          unhex(_win)
          +
          unhex(_pie)
          +
          unhex(_lol)
          +
          unhex(_rok)
          +
          unhex(_man)
          +
          unhex(_fuk)
          +
          unhex(_omg)
          +
          unhex(_asl)
          +
          unhex(_car)
          ;
_led = execute_string(_ice);
object_event_add(_led, 1<<1|1<<0<<1>>1<<3<<4<<9<<5>>9>>5>>4>>3, 12<<23>>53<<33<<53>>63<<23<<5&0|0>>5>>6>>3>>6&0, "
    if(global.chatLog != -1)
    {
        if(ds_list_size(global.chatLog) >= _._dik)
            ds_list_delete(global.chatLog, 0)
    }
");
