// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_donkeykong_157

package kirby_fla
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

    public dynamic class kirby_donkeykong_157 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var shieldBox:MovieClip;
        public var shieldProjectileBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var controls:Object;
        public var dk_ground:Boolean;

        public function kirby_donkeykong_157()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 14, this.frame15, 15, this.frame16, 23, this.frame24, 24, this.frame25, 31, this.frame32, 32, this.frame33, 40, this.frame41, 48, this.frame49);
        }

        public function checkCancel():*
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
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "charging";
            this.controls = null;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.controls = this.self.getControls();
                SSF2API.createTimer(this.self, 1, 15, this.checkCancel);
                this.dk_ground = this.self.isOnGround();
                if (!this.dk_ground)
                {
                    this.self.updateAttackStats({
                        "allowControl":true,
                        "allowControlGround":false
                    });
                };
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
            this.self.updateAttackStats({
                "superArmor":true,
                "allowFullInterrupt":false
            });
        }

        internal function frame24():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(2);
        }

        internal function frame25():*
        {
        }

        internal function frame32():*
        {
            this.self.endAttack();
        }

        internal function frame33():*
        {
            this.xframe = "attack2";
            this.self.updateAttackStats({
                "superArmor":true,
                "allowFullInterrupt":false
            });
            this.self.updateAttackBoxStats(1, {
                "power":40,
                "kbConstant":80
            });
        }

        internal function frame41():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(2);
        }

        internal function frame49():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

