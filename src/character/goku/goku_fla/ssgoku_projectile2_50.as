// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.ssgoku_projectile2_50

package goku_fla
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

    public dynamic class ssgoku_projectile2_50 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var character:*;
        public var currentCharge:Number;
        public var newStats:Object;
        public var newStats2:Object;
        public var newStats3:Object;

        public function ssgoku_projectile2_50()
        {
            addFrameScript(0, this.frame1, 15, this.frame16, 16, this.frame17, 33, this.frame34, 34, this.frame35, 59, this.frame60, 61, this.frame62, 86, this.frame87);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                if (((SSF2API.isReady()) && (this.self)))
                {
                    if (SSF2API != null)
                    {
                        this.currentCharge = this.character.getGlobalVariable("currentCharge");
                    };
                    if (this.currentCharge == 2)
                    {
                        gotoAndPlay("chargeLevel2");
                    };
                    if (this.currentCharge == 3)
                    {
                        gotoAndPlay("chargeLevel3");
                    };
                    if (this.currentCharge == 4)
                    {
                        gotoAndPlay("chargeLevel4");
                    };
                };
            };
        }

        internal function frame16():*
        {
            this.gotoAndStop("stopped");
        }

        internal function frame17():*
        {
            this.newStats = {"power":60};
            this.self.updateAttackBoxStats(1, this.newStats);
        }

        internal function frame34():*
        {
            this.gotoAndStop("stopped2");
        }

        internal function frame35():*
        {
            this.newStats2 = {"power":70};
            this.self.updateAttackBoxStats(1, this.newStats2);
        }

        internal function frame60():*
        {
            this.gotoAndStop("stopped3");
        }

        internal function frame62():*
        {
            if (((!(SSF2API == null)) && (!(this.self == null))))
            {
                this.self.updateAttackStats({"time_max":70});
            };
            this.newStats3 = {"power":80};
            this.self.updateAttackBoxStats(1, this.newStats3);
        }

        internal function frame87():*
        {
            this.gotoAndStop("stopped4");
        }


    }
}//package goku_fla

