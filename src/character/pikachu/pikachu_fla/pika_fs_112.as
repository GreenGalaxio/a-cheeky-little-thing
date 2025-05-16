// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//pikachu_fla.pika_fs_112

package pikachu_fla
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

    public dynamic class pika_fs_112 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;

        public function pika_fs_112()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 24, this.frame25);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.self.updateProjectileStats({
                    "influenceXMovement":35,
                    "influenceYMovement":35
                });
                this.self.updateAttackBoxStats(1, {"kbConstant":15});
                this.self.setGlobalVariable("attack", false);
                if (this.self.getGlobalVariable("attack"))
                {
                    gotoAndPlay("continue");
                };
            };
        }

        internal function frame2():*
        {
            if (this.self.getGlobalVariable("attack"))
            {
                gotoAndPlay("continue");
            };
        }

        internal function frame3():*
        {
            if (this.self.getGlobalVariable("attack"))
            {
                gotoAndPlay("continue");
            };
        }

        internal function frame4():*
        {
            if (this.self.getGlobalVariable("attack"))
            {
                gotoAndPlay("continue");
            };
            this.self.refreshAttackID();
        }

        internal function frame5():*
        {
            if (this.self.getGlobalVariable("attack"))
            {
                gotoAndPlay("continue");
            };
        }

        internal function frame6():*
        {
            if (this.self.getGlobalVariable("attack"))
            {
                gotoAndPlay("continue");
            };
        }

        internal function frame7():*
        {
            if (this.self.getGlobalVariable("attack"))
            {
                gotoAndPlay("continue");
            };
            this.self.refreshAttackID();
        }

        internal function frame8():*
        {
            gotoAndPlay("loop");
        }

        internal function frame9():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "kbConstant":20,
                "damage":20
            });
            SSF2API.playSound("brawl_zap_m");
            SSF2API.shakeCamera(15);
            SSF2API.lightFlash();
        }

        internal function frame25():*
        {
            this.self.setGlobalVariable("attack", false);
            gotoAndPlay("loop");
        }


    }
}//package pikachu_fla

