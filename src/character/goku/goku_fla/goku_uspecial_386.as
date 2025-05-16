// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.goku_uspecial_386

package goku_fla
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

    public dynamic class goku_uspecial_386 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var hitBox7:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var controls:Object;
        public var missed:Boolean;
        public var continuePlaying:Boolean;
        public var grabbed:Boolean;
        public var newStats:Object;
        public var newStats2:Object;
        public var newStats3:Object;

        public function goku_uspecial_386()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 6, this.frame7, 9, this.frame10, 11, this.frame12, 13, this.frame14, 15, this.frame16, 16, this.frame17, 20, this.frame21, 25, this.frame26, 27, this.frame28, 34, this.frame35, 35, this.frame36, 37, this.frame38);
        }

        public function checkGrabbed():*
        {
            if (this.self.getGrabbedOpponent())
            {
                this.grabbed = true;
                this.continuePlaying = true;
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.controls = null;
                this.missed = false;
                this.continuePlaying = false;
            };
            if (((SSF2API.isReady()) && (this.self)))
            {
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
            };
        }

        internal function frame5():*
        {
            this.grabbed = false;
            SSF2API.createTimer(this.self, 1, 2, this.checkGrabbed);
        }

        internal function frame7():*
        {
            this.newStats = {
                "damage":8,
                "bypassNonGrabbed":false,
                "bypassGrabbed":true,
                "hasEffect":true
            };
            this.self.updateAttackBoxStats(1, this.newStats);
            if (!this.continuePlaying)
            {
                this.missed = true;
            };
        }

        internal function frame10():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
            this.self.updateAttackStats({"air_ease":0});
        }

        internal function frame12():*
        {
            this.self.setYSpeed(0);
            this.controls = this.self.getControls();
            if (((!((this.controls.UP) && (this.controls.DOWN))) && (!((this.controls.LEFT) && (this.controls.RIGHT)))))
            {
                if (((this.controls.UP) && (this.controls.RIGHT)))
                {
                    this.self.faceRight();
                    this.self.setXSpeed(31.8198, false);
                    this.self.setYSpeed(-31.8198);
                }
                else
                {
                    if (((this.controls.RIGHT) && (this.controls.DOWN)))
                    {
                        this.self.faceRight();
                        this.self.updateAttackStats({"air_ease":-1});
                        this.self.setXSpeed(31.8198, false);
                        this.self.setYSpeed(31.8198);
                    }
                    else
                    {
                        if (((this.controls.DOWN) && (this.controls.LEFT)))
                        {
                            this.self.faceLeft();
                            this.self.updateAttackStats({"air_ease":-1});
                            this.self.setXSpeed(31.8198, false);
                            this.self.setYSpeed(31.8198);
                        }
                        else
                        {
                            if (((this.controls.LEFT) && (this.controls.UP)))
                            {
                                this.self.faceLeft();
                                this.self.setXSpeed(31.8198, false);
                                this.self.setYSpeed(-31.8198);
                            }
                            else
                            {
                                if (this.controls.DOWN)
                                {
                                    this.self.updateAttackStats({"air_ease":-1});
                                    this.self.setYSpeed(45);
                                }
                                else
                                {
                                    if (this.controls.LEFT)
                                    {
                                        this.self.faceLeft();
                                        this.self.setXSpeed(45, false);
                                    }
                                    else
                                    {
                                        if (this.controls.RIGHT)
                                        {
                                            this.self.faceRight();
                                            this.self.setXSpeed(45, false);
                                        }
                                        else
                                        {
                                            this.self.setYSpeed(-45);
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        internal function frame14():*
        {
            if (((this.self.isOnGround()) && (this.missed)))
            {
                gotoAndPlay("land");
            };
        }

        internal function frame16():*
        {
            this.self.setXSpeed(0, true);
            this.self.setYSpeed(0);
            this.self.playAttackSound(2);
            if (((this.continuePlaying) && (!(this.missed))))
            {
                gotoAndPlay("hit");
            };
        }

        internal function frame17():*
        {
            if (this.grabbed)
            {
                gotoAndPlay("hit");
            };
            this.self.updateAttackStats({
                "air_ease":-1,
                "allowControl":true,
                "allowFastFall":true
            });
        }

        internal function frame21():*
        {
            this.self.endAttack();
        }

        internal function frame26():*
        {
            this.newStats2 = {
                "hitStun":4,
                "power":40,
                "damage":7,
                "kbConstant":95,
                "selfHitStun":3,
                "direction":38,
                "bypassNonGrabbed":true,
                "bypassGrabbed":false,
                "hasEffect":true
            };
            this.self.updateAttackBoxStats(1, this.newStats2);
            this.self.refreshAttackID();
        }

        internal function frame28():*
        {
            this.newStats3 = {"bypassNonGrabbed":false};
            this.self.updateAttackBoxStats(1, this.newStats3);
        }

        internal function frame35():*
        {
            this.self.endAttack();
        }

        internal function frame36():*
        {
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            this.self.playAttackSound(2);
        }

        internal function frame38():*
        {
            this.self.endAttack();
        }


    }
}//package goku_fla

