// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.warioman_dair_57

package wario_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
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

    public dynamic class warioman_dair_57 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var newStats:*;

        public function warioman_dair_57()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 10, this.frame11, 11, this.frame12);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (SSF2API.isReady())
            {
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
                this.self.setXSpeed(5, false);
            };
        }

        internal function frame2():*
        {
            this.self.setXSpeed(5, false);
            this.self.setYSpeed(2);
        }

        internal function frame3():*
        {
            this.self.playVoiceSound(1);
            this.self.setXSpeed(5, false);
            this.self.setYSpeed(2);
        }

        internal function frame5():*
        {
            this.self.setXSpeed(0, false);
            this.self.setYSpeed(5);
        }

        internal function frame6():*
        {
            this.self.setXSpeed(-2, false);
            this.self.setYSpeed(5);
        }

        internal function frame7():*
        {
            this.self.setXSpeed(-2, false);
            this.self.setYSpeed(3);
            this.self.playAttackSound(1);
            this.newStats = {"direction":300};
            this.self.updateAttackBoxStats(1, this.newStats);
        }

        internal function frame8():*
        {
            this.self.setXSpeed(-3, false);
            this.self.setYSpeed(-4);
        }

        internal function frame9():*
        {
            this.self.setXSpeed(-2, false);
            this.self.setYSpeed(-3);
            this.newStats = {"direction":180};
            this.self.updateAttackBoxStats(1, this.newStats);
        }

        internal function frame11():*
        {
            this.newStats = {"direction":110};
            this.self.updateAttackBoxStats(1, this.newStats);
        }

        internal function frame12():*
        {
            this.self.endAttack();
        }


    }
}//package wario_fla

