// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//link_fla.link_new_usmash_37

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

    public dynamic class link_new_usmash_37 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var self:*;
        public var xframe:String;

        public function link_new_usmash_37()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 13, this.frame14, 19, this.frame20, 22, this.frame23, 26, this.frame27, 31, this.frame32, 41, this.frame42);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("nStoredLabel", null);
                this.self.setGlobalVariable("sStoredLabel", null);
            };
        }

        internal function frame4():*
        {
            this.xframe = "charging";
        }

        internal function frame9():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame10():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound(1);
            this.self.refreshAttackID();
        }

        internal function frame11():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame12():*
        {
        }

        internal function frame14():*
        {
        }

        internal function frame20():*
        {
            this.self.playAttackSound(1);
            this.self.updateAttackBoxStats(1, {
                "damage":3,
                "weightKB":33
            });
            this.self.refreshAttackID();
        }

        internal function frame23():*
        {
        }

        internal function frame27():*
        {
            this.self.playAttackSound(2);
            this.self.updateAttackBoxStats(1, {
                "power":70,
                "kbConstant":80,
                "weightKB":0,
                "ignoreChargeDamage":false
            });
            this.self.updateAttackBoxStats(2, {
                "power":70,
                "kbConstant":80,
                "weightKB":0,
                "ignoreChargeDamage":false
            });
            this.self.refreshAttackID();
        }

        internal function frame32():*
        {
        }

        internal function frame42():*
        {
            this.self.endAttack();
        }


    }
}//package link_fla

