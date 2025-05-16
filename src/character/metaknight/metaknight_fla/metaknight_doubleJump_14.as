// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//metaknight_fla.metaknight_doubleJump_14

package metaknight_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
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

    public dynamic class metaknight_doubleJump_14 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var done:Boolean;

        public function metaknight_doubleJump_14()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 15, this.frame16);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.done = false;
            };
        }

        internal function frame3():*
        {
            SSF2API.playSound("mk_jump2");
        }

        internal function frame16():*
        {
            this.done = true;
            this.self.endAttack();
        }


    }
}//package metaknight_fla

