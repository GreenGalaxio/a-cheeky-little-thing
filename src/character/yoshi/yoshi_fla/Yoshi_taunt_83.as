// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//yoshi_fla.Yoshi_taunt_83

package yoshi_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
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
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class Yoshi_taunt_83 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;

        public function Yoshi_taunt_83()
        {
            addFrameScript(0, this.frame1, 10, this.frame11, 20, this.frame21, 30, this.frame31, 33, this.frame34, 47, this.frame48, 54, this.frame55, 77, this.frame78, 78, this.frame79, 95, this.frame96);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame11():*
        {
            SSF2API.playSound("Yoshi_jump1");
        }

        internal function frame21():*
        {
            SSF2API.playSound("Yoshi_jump1");
        }

        internal function frame31():*
        {
            SSF2API.playSound("Yoshi_jump1");
        }

        internal function frame34():*
        {
            SSF2API.playSound("Yoshi_Jump01");
        }

        internal function frame48():*
        {
            this.self.endAttack();
        }

        internal function frame55():*
        {
            SSF2API.playSound("Yoshi_AttackU");
        }

        internal function frame78():*
        {
            this.self.endAttack();
        }

        internal function frame79():*
        {
            SSF2API.playSound("yoshi_grunt3");
        }

        internal function frame96():*
        {
            this.self.endAttack();
        }


    }
}//package yoshi_fla

