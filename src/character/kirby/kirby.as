﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby

package 
{
    import flash.display.MovieClip;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.globalization.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.xml.*;

    public dynamic class kirby extends MovieClip 
    {

        public var stance:MovieClip;

        public function kirby()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22, 22, this.frame23, 23, this.frame24, 24, this.frame25, 25, this.frame26, 26, this.frame27, 27, this.frame28, 28, this.frame29, 29, this.frame30, 30, this.frame31, 31, this.frame32, 32, this.frame33, 33, this.frame34, 34, this.frame35, 35, this.frame36, 36, this.frame37, 37, this.frame38, 38, this.frame39, 39, this.frame40, 40, this.frame41, 41, this.frame42, 42, this.frame43, 43, this.frame44, 44, this.frame45, 45, this.frame46, 46, this.frame47, 47, this.frame48, 48, this.frame49, 49, this.frame50, 50, this.frame51, 51, this.frame52, 52, this.frame53, 53, this.frame54, 54, this.frame55, 55, this.frame56, 56, this.frame57, 57, this.frame58, 58, this.frame59, 59, this.frame60, 60, this.frame61, 61, this.frame62, 62, this.frame63, 63, this.frame64, 64, this.frame65, 65, this.frame66, 66, this.frame67, 67, this.frame68, 68, this.frame69, 69, this.frame70, 70, this.frame71, 71, this.frame72, 72, this.frame73, 73, this.frame74, 74, this.frame75, 75, this.frame76, 76, this.frame77, 77, this.frame78, 78, this.frame79, 79, this.frame80, 80, this.frame81, 81, this.frame82, 82, this.frame83, 83, this.frame84, 84, this.frame85, 85, this.frame86, 86, this.frame87, 87, this.frame88, 88, this.frame89, 89, this.frame90, 90, this.frame91, 91, this.frame92, 92, this.frame93, 93, this.frame94, 94, this.frame95, 95, this.frame96, 96, this.frame97, 97, this.frame98, 98, this.frame99, 99, this.frame100);
        }

        internal function frame1():*
        {
            this.xframe = "stand";
            stop();
        }

        internal function frame2():*
        {
            this.xframe = "entrance";
            stop();
        }

        internal function frame3():*
        {
            this.xframe = "revival";
            stop();
        }

        internal function frame4():*
        {
            this.xframe = "win";
            stop();
        }

        internal function frame5():*
        {
            this.xframe = "lose";
            stop();
        }

        internal function frame6():*
        {
            this.xframe = "walk";
            stop();
        }

        internal function frame7():*
        {
            this.xframe = "run";
            stop();
        }

        internal function frame8():*
        {
            this.xframe = "jump";
            stop();
        }

        internal function frame9():*
        {
            this.xframe = "jump_midair";
            stop();
        }

        internal function frame10():*
        {
            this.xframe = "fall";
            stop();
        }

        internal function frame11():*
        {
            this.xframe = "land";
            stop();
        }

        internal function frame12():*
        {
            this.xframe = "skid";
            stop();
        }

        internal function frame13():*
        {
            this.xframe = "a";
            stop();
        }

        internal function frame14():*
        {
            this.xframe = "a_forward";
            stop();
        }

        internal function frame15():*
        {
            this.xframe = "a_forward_tilt";
            stop();
        }

        internal function frame16():*
        {
            this.xframe = "a_forwardsmash";
            stop();
        }

        internal function frame17():*
        {
            this.xframe = "a_up";
            stop();
        }

        internal function frame18():*
        {
            this.xframe = "a_up_tilt";
            stop();
        }

        internal function frame19():*
        {
            this.xframe = "a_down";
            stop();
        }

        internal function frame20():*
        {
            this.xframe = "b";
            stop();
        }

        internal function frame21():*
        {
            this.xframe = "b_air";
            stop();
        }

        internal function frame22():*
        {
            this.xframe = "b_up";
            stop();
        }

        internal function frame23():*
        {
            this.xframe = "b_up_air";
            stop();
        }

        internal function frame24():*
        {
            this.xframe = "b_forward";
            stop();
        }

        internal function frame25():*
        {
            this.xframe = "b_forward_air";
            stop();
        }

        internal function frame26():*
        {
            this.xframe = "b_down";
            stop();
        }

        internal function frame27():*
        {
            this.xframe = "b_down_air";
            stop();
        }

        internal function frame28():*
        {
            this.xframe = "a_air";
            stop();
        }

        internal function frame29():*
        {
            this.xframe = "a_air_up";
            stop();
        }

        internal function frame30():*
        {
            this.xframe = "a_air_forward";
            stop();
        }

        internal function frame31():*
        {
            this.xframe = "a_air_backward";
            stop();
        }

        internal function frame32():*
        {
            this.xframe = "a_air_down";
            stop();
        }

        internal function frame33():*
        {
            this.xframe = "throw_up";
            stop();
        }

        internal function frame34():*
        {
            this.xframe = "throw_forward";
            stop();
        }

        internal function frame35():*
        {
            this.xframe = "throw_down";
            stop();
        }

        internal function frame36():*
        {
            this.xframe = "throw_back";
            stop();
        }

        internal function frame37():*
        {
            this.xframe = "item";
            stop();
        }

        internal function frame38():*
        {
            this.xframe = "crouch";
            stop();
        }

        internal function frame39():*
        {
            this.xframe = "crouch_attack";
            stop();
        }

        internal function frame40():*
        {
            this.xframe = "grab";
            stop();
        }

        internal function frame41():*
        {
            this.xframe = "hurt";
            stop();
        }

        internal function frame42():*
        {
            this.xframe = "dodgeroll";
            stop();
        }

        internal function frame43():*
        {
            this.xframe = "airdodge";
            stop();
        }

        internal function frame44():*
        {
            this.xframe = "sidestep";
            stop();
        }

        internal function frame45():*
        {
            this.xframe = "flying";
            stop();
        }

        internal function frame46():*
        {
            this.xframe = "hang";
            stop();
        }

        internal function frame47():*
        {
            this.xframe = "climbup";
            stop();
        }

        internal function frame48():*
        {
            this.xframe = "rollup";
            stop();
        }

        internal function frame49():*
        {
            this.xframe = "ledge_attack";
            stop();
        }

        internal function frame50():*
        {
            this.xframe = "roll";
            stop();
        }

        internal function frame51():*
        {
            this.xframe = "defend";
            stop();
        }

        internal function frame52():*
        {
            this.xframe = "stunned";
            stop();
        }

        internal function frame53():*
        {
            this.xframe = "dizzy";
            stop();
        }

        internal function frame54():*
        {
            this.xframe = "falling";
            stop();
        }

        internal function frame55():*
        {
            this.xframe = "crash";
            stop();
        }

        internal function frame56():*
        {
            this.xframe = "getup_attack";
            stop();
        }

        internal function frame57():*
        {
            this.xframe = "carry";
            stop();
        }

        internal function frame58():*
        {
            this.xframe = "swim";
            stop();
        }

        internal function frame59():*
        {
            this.xframe = "ladder";
            stop();
        }

        internal function frame60():*
        {
            this.xframe = "edgelean";
            stop();
        }

        internal function frame61():*
        {
            this.xframe = "wallstick";
            stop();
        }

        internal function frame62():*
        {
            this.xframe = "frozen";
            stop();
        }

        internal function frame63():*
        {
            this.xframe = "taunt";
            stop();
        }

        internal function frame64():*
        {
            this.xframe = "egg";
            stop();
        }

        internal function frame65():*
        {
            this.xframe = "star";
            stop();
        }

        internal function frame66():*
        {
            this.xframe = "special";
            stop();
        }

        internal function frame67():*
        {
            this.xframe = "select_screen";
            stop();
        }

        internal function frame68():*
        {
            this.xframe = "starko";
            stop();
        }

        internal function frame69():*
        {
            this.xframe = "screenko";
            stop();
        }

        internal function frame70():*
        {
            this.xframe = "pitfall";
            stop();
        }

        internal function frame71():*
        {
            this.xframe = "tech_ground";
            stop();
        }

        internal function frame72():*
        {
            this.xframe = "tech_roll";
            stop();
        }

        internal function frame73():*
        {
            this.xframe = "kirby_blackmage";
            stop();
        }

        internal function frame74():*
        {
            this.xframe = "kirby_bomberman";
            stop();
        }

        internal function frame75():*
        {
            this.xframe = "kirby_captainfalcon";
            stop();
        }

        internal function frame76():*
        {
            this.xframe = "kirby_chibirobo";
            stop();
        }

        internal function frame77():*
        {
            this.xframe = "kirby_dkong";
            stop();
        }

        internal function frame78():*
        {
            this.xframe = "kirby_Fox";
            stop();
        }

        internal function frame79():*
        {
            this.xframe = "kirby_goku";
            stop();
        }

        internal function frame80():*
        {
            this.xframe = "kirby_ichigo";
            stop();
        }

        internal function frame81():*
        {
            this.xframe = "kirby_jigglypuff";
            stop();
        }

        internal function frame82():*
        {
            this.xframe = "kirby_link";
            stop();
        }

        internal function frame83():*
        {
            this.xframe = "kirby_lloyd";
            stop();
        }

        internal function frame84():*
        {
            this.xframe = "kirby_mario";
            stop();
        }

        internal function frame85():*
        {
            this.xframe = "kirby_marth";
            stop();
        }

        internal function frame86():*
        {
            this.xframe = "kirby_megaman";
            stop();
        }

        internal function frame87():*
        {
            this.xframe = "kirby_metaknight";
            stop();
        }

        internal function frame88():*
        {
            this.xframe = "kirby_naruto";
            stop();
        }

        internal function frame89():*
        {
            this.xframe = "kirby_ness";
            stop();
        }

        internal function frame90():*
        {
            this.xframe = "kirby_peach";
            stop();
        }

        internal function frame91():*
        {
            this.xframe = "kirby_pikachu";
            stop();
        }

        internal function frame92():*
        {
            this.xframe = "kirby_samus";
            stop();
        }

        internal function frame93():*
        {
            this.xframe = "kirby_sheik";
            stop();
        }

        internal function frame94():*
        {
            this.xframe = "kirby_sonic";
            stop();
        }

        internal function frame95():*
        {
            this.xframe = "kirby_sora";
            stop();
        }

        internal function frame96():*
        {
            this.xframe = "kirby_Tails";
            stop();
        }

        internal function frame97():*
        {
            this.xframe = "kirby_wario";
            stop();
        }

        internal function frame98():*
        {
            this.xframe = "kirby_Yoshi";
            stop();
        }

        internal function frame99():*
        {
            this.xframe = "kirby_zamus";
            stop();
        }

        internal function frame100():*
        {
            this.xframe = "kirby_zelda";
            stop();
        }


    }
}//package 

