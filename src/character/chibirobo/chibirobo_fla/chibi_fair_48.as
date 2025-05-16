// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//chibirobo_fla.chibi_fair_48

package chibirobo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.display.*;
    import flash.media.*;
    import flash.geom.*;
    import flash.events.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
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

    public dynamic class chibi_fair_48 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var playsound:*;

        public function chibi_fair_48()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 5, this.frame6, 8, this.frame9, 14, this.frame15, 15, this.frame16);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            };
        }

        internal function frame3():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame6():*
        {
            this.playsound = SSF2API.random();
            if (((this.playsound > 0) && (this.playsound <= 0.25)))
            {
                SSF2API.playSound("chibi_Spoon1");
            };
            if (((this.playsound > 0.25) && (this.playsound <= 0.5)))
            {
                SSF2API.playSound("chibi_Spoon2");
            };
            if (((this.playsound > 0.5) && (this.playsound <= 0.75)))
            {
                SSF2API.playSound("chibi_Spoon3");
            };
            if (((this.playsound > 0.75) && (this.playsound <= 1)))
            {
                SSF2API.playSound("chibi_Spoon4");
            };
        }

        internal function frame9():*
        {
            this.self.updateAttackBoxStats(1, {"direction":85});
        }

        internal function frame15():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
        }

        internal function frame16():*
        {
            this.self.endAttack();
        }


    }
}//package chibirobo_fla

