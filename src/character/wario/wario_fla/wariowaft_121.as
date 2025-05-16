// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.wariowaft_121

package wario_fla
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

    public dynamic class wariowaft_121 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var self:*;
        public var fartcharge:Number;
        public var newStats:*;

        public function wariowaft_121()
        {
            addFrameScript(0, this.frame1, 18, this.frame19, 21, this.frame22, 25, this.frame26, 29, this.frame30, 31, this.frame32, 37, this.frame38, 40, this.frame41, 43, this.frame44, 61, this.frame62, 65, this.frame66, 67, this.frame68, 85, this.frame86, 88, this.frame89, 89, this.frame90, 91, this.frame92, 107, this.frame108);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.fartcharge = 0;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.fartcharge = this.self.getLastUsed();
                if (this.fartcharge >= 3600)
                {
                    gotoAndPlay("level4");
                };
                if (((this.fartcharge > 2100) && (this.fartcharge < 3600)))
                {
                    gotoAndPlay("level3");
                };
                if (((this.fartcharge > 1200) && (this.fartcharge <= 2100)))
                {
                    gotoAndPlay("level2");
                };
                if (((this.fartcharge > 600) && (this.fartcharge <= 1200)))
                {
                    gotoAndPlay("level1");
                }
                else
                {
                    this.self.updateAttackStats({"air_ease":-1});
                };
            };
        }

        internal function frame19():*
        {
            this.self.playAttackSound(1);
            this.newStats = {
                "stun":25,
                "power":0,
                "damage":0,
                "hasEffect":false
            };
            this.self.updateAttackBoxStats(1, this.newStats);
        }

        internal function frame22():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame26():*
        {
            this.self.endAttack();
        }

        internal function frame30():*
        {
            this.newStats = {
                "power":50,
                "damage":10,
                "kbConstant":60,
                "hitStun":2,
                "hitLag":-1
            };
            this.self.updateAttackBoxStats(1, this.newStats);
        }

        internal function frame32():*
        {
            this.self.attachEffectOverlay("downblevel1");
            this.self.setXSpeed(0);
            this.self.playAttackSound(3);
            this.self.updateAttackStats({"allowControl":true});
        }

        internal function frame38():*
        {
            this.self.endAttack();
        }

        internal function frame41():*
        {
            this.newStats = {
                "power":60,
                "damage":17,
                "kbConstant":70,
                "hitLag":-1,
                "hitStun":3,
                "selfHitStun":4
            };
            this.self.updateAttackBoxStats(1, this.newStats);
        }

        internal function frame44():*
        {
            this.self.attachEffectOverlay("downblevel2");
            this.self.playAttackSound(3);
            this.self.setYSpeed(-12);
            SSF2API.shakeCamera(4);
            this.self.setXSpeed(0);
            this.self.updateAttackStats({"allowControl":true});
        }

        internal function frame62():*
        {
            this.self.endAttack();
        }

        internal function frame66():*
        {
            this.newStats = {
                "power":65,
                "damage":21,
                "kbConstant":75,
                "hitStun":5,
                "selfHitStun":5,
                "hitLag":-1
            };
            this.self.updateAttackBoxStats(1, this.newStats);
        }

        internal function frame68():*
        {
            this.self.attachEffectOverlay("downblevel3");
            this.self.setXSpeed(0);
            this.self.playAttackSound(2);
            this.self.setYSpeed(-16);
            SSF2API.shakeCamera(9);
            this.self.updateAttackStats({"allowControl":true});
        }

        internal function frame86():*
        {
            this.self.endAttack();
        }

        internal function frame89():*
        {
            this.newStats = {
                "power":65,
                "damage":30,
                "kbConstant":70,
                "hitLag":-1,
                "hitStun":15,
                "selfHitStun":15
            };
            this.self.updateAttackBoxStats(1, this.newStats);
        }

        internal function frame90():*
        {
            this.self.attachEffectOverlay("downblevel4");
            this.self.setXSpeed(0);
            this.self.playAttackSound(4);
            this.self.setYSpeed(-20);
            SSF2API.shakeCamera(16);
            this.self.updateAttackStats({"allowControl":true});
            this.newStats = {"selfHitStun":6};
            this.self.updateAttackBoxStats(1, this.newStats);
        }

        internal function frame92():*
        {
            this.newStats = {
                "power":50,
                "damage":11,
                "kbConstant":70,
                "hitStun":6,
                "selfHitStun":6,
                "hitLag":-1
            };
            this.self.updateAttackBoxStats(1, this.newStats);
        }

        internal function frame108():*
        {
            this.self.endAttack();
        }


    }
}//package wario_fla

