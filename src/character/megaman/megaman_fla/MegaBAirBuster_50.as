// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.MegaBAirBuster_50

package megaman_fla
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

    public dynamic class MegaBAirBuster_50 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var pLockBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var action:String;
        public var rapidFire:Number;
        public var checkPress:Boolean;
        public var localWeapon:*;
        public var controls:Object;
        public var playEffect:*;
        public var effectProject:*;
        public var chargeTime:*;

        public function MegaBAirBuster_50()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 9, this.frame10, 10, this.frame11, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22, 23, this.frame24, 24, this.frame25, 26, this.frame27, 30, this.frame31, 39, this.frame40);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
            this.action = "standing";
            this.rapidFire = 0;
            this.checkPress = true;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.localWeapon = this.self.getGlobalVariable("weapon");
                switch (this.localWeapon)
                {
                    case 0:
                        SSF2API.print("LOL K");
                        break;
                    case 1:
                        this.self.forceAttack("switchBlock_air", null, true);
                        break;
                    case 2:
                        if (this.self.getGlobalVariable("crashBomb") != 1)
                        {
                            this.self.forceAttack("switchBomb_air", null, true);
                        }
                        else
                        {
                            this.self.endAttack();
                        };
                        break;
                    case 3:
                        this.self.forceAttack("switchBHB_air", null, true);
                        break;
                    case 4:
                        this.self.forceAttack("switchBlade_air", null, true);
                        break;
                    default:
                        SSF2API.print("failed");
                };
                this.controls = this.self.getControls();
                this.self.setAttackEnabled("b", false);
                this.self.setAttackEnabled("b_air", false);
                this.playEffect = this.self.getGlobalVariable("playEffect");
            };
        }

        internal function frame2():*
        {
            this.xframe = "charging";
            this.action = "rising";
            this.self.updateAttackStats({
                "allowRun":false,
                "allowControl":true
            });
        }

        internal function frame10():*
        {
            this.gotoAndPlay("rising");
        }

        internal function frame11():*
        {
            this.xframe = "charging";
            this.action = "falling";
            this.self.updateAttackStats({
                "allowRun":false,
                "allowControl":true
            });
        }

        internal function frame19():*
        {
            this.gotoAndPlay("falling");
        }

        internal function frame20():*
        {
            this.xframe = "attack";
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            this.self.updateAttackStats({"allowJump":false});
            this.effectProject = this.self.getGlobalVariable("bustCharge");
        }

        internal function frame21():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
            this.self.updateAttackStats({"linkFrames":false});
        }

        internal function frame22():*
        {
            this.self.playAttackSound(2);
            this.chargeTime = this.self.getExecTime();
            if (this.chargeTime < 15)
            {
                this.self.fireProjectile("megaman_buster1", 6, -13);
            }
            else
            {
                if (this.chargeTime < 25)
                {
                    this.self.fireProjectile("megaman_buster2", 15, -33);
                }
                else
                {
                    this.self.fireProjectile("megaman_buster3", 15, -33);
                };
            };
        }

        internal function frame24():*
        {
            this.self.endAttack();
        }

        internal function frame25():*
        {
            this.xframe = "attack2";
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            this.self.updateAttackStats({
                "allowJump":false,
                "linkFrames":true,
                "allowTurn":false
            });
            this.self.setXSpeed(-6, false);
            this.effectProject = this.self.getGlobalVariable("bustCharge");
            if (((!(SSF2API.getProjectile(this.effectProject) == null)) && (!(this.effectProject == null))))
            {
                this.effectProject.destroy();
            };
        }

        internal function frame27():*
        {
            this.self.playAttackSound(3);
        }

        internal function frame31():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            this.self.updateAttackStats({"linkFrames":false});
            this.self.fireProjectile("megaman_buster_full", 30, -20);
        }

        internal function frame40():*
        {
            this.self.endAttack();
        }


    }
}//package megaman_fla

