// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_downB_131

package naruto_fla
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

    public dynamic class naruto_downB_131 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var onGround:*;
        public var facing:*;
        public var reverse:Boolean;
        public var forward:Boolean;
        public var fired:Boolean;
        public var xframe:String;
        public var soundPlayed:*;
        public var controls:Object;

        public function naruto_downB_131()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 13, this.frame14, 15, this.frame16);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.onGround = this.self.isOnGround();
                this.facing = this.self.isFacingRight();
                this.reverse = false;
                this.forward = false;
                this.fired = false;
            };
            this.xframe = "start";
            this.soundPlayed = false;
        }

        internal function frame2():*
        {
            this.controls = this.self.getControls();
            if ((((this.controls.RIGHT) && (!(this.facing))) || ((this.controls.LEFT) && (this.facing))))
            {
                this.reverse = true;
            };
            if ((((this.controls.LEFT) && (!(this.facing))) || ((this.controls.RIGHT) && (this.facing))))
            {
                this.forward = true;
            };
            this.self.setGlobalVariable("cloneStartedGround", true);
            if (this.self.getGlobalVariable("cloneStartedGround"))
            {
                this.self.playVoiceSound(1);
            };
            if (this.self.getGlobalVariable("cloneStartedGround"))
            {
                this.self.playAttackSound(1);
            };
        }

        internal function frame3():*
        {
            this.controls = this.self.getControls();
            if ((((this.controls.RIGHT) && (!(this.facing))) || ((this.controls.LEFT) && (this.facing))))
            {
                this.reverse = true;
            };
            if ((((this.controls.LEFT) && (!(this.facing))) || ((this.controls.RIGHT) && (this.facing))))
            {
                this.forward = true;
            };
            this.self.attachEffect("naruto_summonClone");
        }

        internal function frame4():*
        {
            this.controls = this.self.getControls();
            if ((((this.controls.RIGHT) && (!(this.facing))) || ((this.controls.LEFT) && (this.facing))))
            {
                this.reverse = true;
            };
            if ((((this.controls.LEFT) && (!(this.facing))) || ((this.controls.RIGHT) && (this.facing))))
            {
                this.forward = true;
            };
            this.xframe = "handClasp";
        }

        internal function frame5():*
        {
            this.controls = this.self.getControls();
            if ((((this.controls.RIGHT) && (!(this.facing))) || ((this.controls.LEFT) && (this.facing))))
            {
                this.reverse = true;
            };
            if ((((this.controls.LEFT) && (!(this.facing))) || ((this.controls.RIGHT) && (this.facing))))
            {
                this.forward = true;
            };
        }

        internal function frame6():*
        {
            this.controls = this.self.getControls();
            if ((((this.controls.RIGHT) && (!(this.facing))) || ((this.controls.LEFT) && (this.facing))))
            {
                this.reverse = true;
            };
            if ((((this.controls.LEFT) && (!(this.facing))) || ((this.controls.RIGHT) && (this.facing))))
            {
                this.forward = true;
            };
        }

        internal function frame7():*
        {
            this.controls = this.self.getControls();
            if ((((this.controls.RIGHT) && (!(this.facing))) || ((this.controls.LEFT) && (this.facing))))
            {
                this.reverse = true;
            };
            if ((((this.controls.LEFT) && (!(this.facing))) || ((this.controls.RIGHT) && (this.facing))))
            {
                this.forward = true;
            };
            this.xframe = "finishedChecks";
        }

        internal function frame8():*
        {
            this.controls = this.self.getControls();
            if ((((this.controls.RIGHT) && (!(this.facing))) || ((this.controls.LEFT) && (this.facing))))
            {
                this.reverse = true;
            };
            if ((((this.controls.LEFT) && (!(this.facing))) || ((this.controls.RIGHT) && (this.facing))))
            {
                this.forward = true;
            };
            if ((((this.self.getGlobalVariable("cloneStartedGround")) && (this.reverse)) && (!(this.fired))))
            {
                this.fired = true;
                this.self.fireProjectile("naruto_clone2", -100, 0);
            }
            else
            {
                if ((((this.self.getGlobalVariable("cloneStartedGround")) && (this.forward)) && (!(this.fired))))
                {
                    this.fired = true;
                    this.self.fireProjectile("naruto_clone2", 50, 0);
                };
            };
        }

        internal function frame9():*
        {
            this.controls = this.self.getControls();
            if ((((this.controls.RIGHT) && (!(this.facing))) || ((this.controls.LEFT) && (this.facing))))
            {
                this.reverse = true;
            };
            if ((((this.controls.LEFT) && (!(this.facing))) || ((this.controls.RIGHT) && (this.facing))))
            {
                this.forward = true;
            };
            if ((((this.self.getGlobalVariable("cloneStartedGround")) && (this.reverse)) && (!(this.fired))))
            {
                this.fired = true;
                this.self.fireProjectile("naruto_clone2", -100, 0);
            }
            else
            {
                if ((((this.self.getGlobalVariable("cloneStartedGround")) && (this.forward)) && (!(this.fired))))
                {
                    this.fired = true;
                    this.self.fireProjectile("naruto_clone2", 50, 0);
                };
            };
            this.xframe = "afterShoot1";
        }

        internal function frame10():*
        {
            this.controls = this.self.getControls();
            if ((((this.controls.RIGHT) && (!(this.facing))) || ((this.controls.LEFT) && (this.facing))))
            {
                this.reverse = true;
            };
            if ((((this.controls.LEFT) && (!(this.facing))) || ((this.controls.RIGHT) && (this.facing))))
            {
                this.forward = true;
            };
            if ((((this.self.getGlobalVariable("cloneStartedGround")) && (this.reverse)) && (!(this.fired))))
            {
                this.fired = true;
                this.self.fireProjectile("naruto_clone2", -100, 0);
            }
            else
            {
                if ((((this.self.getGlobalVariable("cloneStartedGround")) && (this.forward)) && (!(this.fired))))
                {
                    this.fired = true;
                    this.self.fireProjectile("naruto_clone2", 50, 0);
                };
            };
        }

        internal function frame11():*
        {
            if ((((this.self.getGlobalVariable("cloneStartedGround")) && (!(this.reverse))) && (!(this.fired))))
            {
                this.fired = true;
                this.self.fireProjectile("naruto_clone2");
            };
            this.xframe = "afterShoot2";
        }

        internal function frame12():*
        {
            if (!this.onGround)
            {
                this.self.setAttackEnabled(false, "b_down_air");
            };
        }

        internal function frame14():*
        {
            this.xframe = "handRelease";
        }

        internal function frame16():*
        {
            this.self.endAttack();
        }


    }
}//package naruto_fla

