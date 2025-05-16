// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//link_fla.link_new_uspec_44

package link_fla
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

    public dynamic class link_new_uspec_44 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var xframe:String;
        public var chargeCount:Number;

        public function link_new_uspec_44()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 7, this.frame8, 8, this.frame9, 15, this.frame16, 16, this.frame17, 21, this.frame22, 23, this.frame24, 25, this.frame26, 27, this.frame28, 29, this.frame30, 30, this.frame31, 31, this.frame32, 33, this.frame34, 35, this.frame36, 38, this.frame39, 40, this.frame41, 55, this.frame56);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
            this.chargeCount = 13;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("nStoredLabel", null);
                this.self.setGlobalVariable("sStoredLabel", null);
            };
        }

        internal function frame4():*
        {
            this.xframe = "charging";
            this.self.playAttackSound(this.chargeCount);
        }

        internal function frame8():*
        {
            this.chargeCount++;
        }

        internal function frame9():*
        {
            if (this.chargeCount < 19)
            {
                this.gotoAndPlay("charging");
            };
            if (this.chargeCount == 19)
            {
                this.self.playAttackSound(19);
            };
        }

        internal function frame16():*
        {
            gotoAndPlay("finishedcharge");
        }

        internal function frame17():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
        }

        internal function frame22():*
        {
            this.self.updateAttackBoxStats(1, {
                "power":68,
                "damage":9,
                "kbConstant":80
            });
            this.self.playAttackSound(2);
        }

        internal function frame24():*
        {
            this.self.playAttackSound(3);
        }

        internal function frame26():*
        {
            this.self.playAttackSound(4);
        }

        internal function frame28():*
        {
            this.self.playAttackSound(5);
        }

        internal function frame30():*
        {
            this.self.playAttackSound(6);
        }

        internal function frame31():*
        {
            this.self.updateAttackBoxStats(1, {
                "kbConstant":80,
                "power":20,
                "damage":7
            });
        }

        internal function frame32():*
        {
            this.self.playAttackSound(7);
        }

        internal function frame34():*
        {
            this.self.playAttackSound(8);
        }

        internal function frame36():*
        {
            this.self.playAttackSound(9);
        }

        internal function frame39():*
        {
            this.self.playAttackSound(10);
        }

        internal function frame41():*
        {
            this.self.playAttackSound(11);
            this.self.playAttackSound(12);
        }

        internal function frame56():*
        {
            this.self.endAttack();
        }


    }
}//package link_fla

