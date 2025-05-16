// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zamus_fla.zamus_spec_up_air_37

package zamus_fla
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

    public dynamic class zamus_spec_up_air_37 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hand2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var currentSpeed:Number;
        public var self:*;

        public function zamus_spec_up_air_37()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 5, this.frame6, 7, this.frame8, 10, this.frame11, 13, this.frame14, 18, this.frame19);
        }

        internal function frame1():*
        {
            this.currentSpeed = 0;
            this.self = SSF2API.getCharacter(this);
            if (((parent) && (SSF2API.isReady())))
            {
                this.self.setGlobalVariable("tether", false);
                this.currentSpeed = this.self.getYSpeed();
                if (this.currentSpeed < 0)
                {
                    if (this.currentSpeed < -15.2)
                    {
                        this.currentSpeed = -15.2;
                    };
                    this.currentSpeed = (this.currentSpeed * 1.4);
                    this.self.setYSpeed(this.currentSpeed);
                };
            };
        }

        internal function frame4():*
        {
            this.self.setGlobalVariable("tether", true);
            this.self.setGlobalVariable("lastTether", "upB");
        }

        internal function frame6():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame8():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "canDI":true,
                "direction":110,
                "hitStun":5,
                "power":70
            });
        }

        internal function frame11():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "reversableAngle":true,
                "direction":270,
                "hitStun":2,
                "power":30,
                "kbConstant":80
            });
        }

        internal function frame14():*
        {
            this.self.setGlobalVariable("tether", false);
        }

        internal function frame19():*
        {
            this.self.endAttack();
        }


    }
}//package zamus_fla

