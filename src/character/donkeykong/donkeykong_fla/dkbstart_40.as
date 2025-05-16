// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//donkeykong_fla.dkbstart_40

package donkeykong_fla
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

    public dynamic class dkbstart_40 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var shieldBox:MovieClip;
        public var self:*;
        public var damageVar:*;
        public var xframe:String;
        public var controls:Object;

        public function dkbstart_40()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 14, this.frame15, 15, this.frame16, 23, this.frame24, 24, this.frame25, 31, this.frame32, 32, this.frame33, 40, this.frame41, 48, this.frame49);
        }

        public function checkCancel():*
        {
            if (((parent) && (SSF2API.isReady())))
            {
                this.controls = this.self.getControls();
                if (this.controls.RIGHT)
                {
                    this.self.setGlobalVariable("rollRight", true);
                }
                else
                {
                    this.self.setGlobalVariable("rollRight", false);
                };
                if (this.controls.SHIELD)
                {
                    this.self.endAttack();
                };
            };
        }

        internal function frame1():*
        {
            SSF2API.createTimer(this.self, 1, 15, this.checkCancel);
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            this.damageVar = 6;
            if (SSF2API.isReady())
            {
                this.xframe = "charging";
                this.damageVar = this.self.getAttackBoxStat(1, "damage");
                this.controls = this.self.getControls();
            };
        }

        internal function frame7():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame15():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame16():*
        {
            this.xframe = "attack";
            this.damageVar = (8 + (this.self.getAttackStat("chargetime") / 3));
            if (this.damageVar < 8)
            {
                this.damageVar = 8;
            };
            if (this.damageVar > 23)
            {
                this.damageVar = 23;
                this.self.updateAttackStats({"superArmor":true});
            };
            this.self.updateAttackStats({"allowFullInterrupt":false});
            this.self.updateAttackBoxStats(1, {"damage":this.damageVar});
        }

        internal function frame24():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(2);
        }

        internal function frame25():*
        {
            this.self.attachEffect("dk_punchTrail");
        }

        internal function frame32():*
        {
            this.self.endAttack();
        }

        internal function frame33():*
        {
            this.controls = this.self.getControls();
            if (this.controls.RIGHT)
            {
                this.self.setGlobalVariable("rollRight", true);
            }
            else
            {
                this.self.setGlobalVariable("rollRight", false);
            };
            this.xframe = "attack2";
            this.self.updateAttackStats({
                "superArmor":true,
                "allowFullInterrupt":false
            });
            this.self.updateAttackBoxStats(1, {"damage":25});
        }

        internal function frame41():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(2);
            this.self.attachEffect("dk_punchTrail");
        }

        internal function frame49():*
        {
            this.self.endAttack();
        }


    }
}//package donkeykong_fla

