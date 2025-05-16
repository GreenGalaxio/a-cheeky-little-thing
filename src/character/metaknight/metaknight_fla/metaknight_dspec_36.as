// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//metaknight_fla.metaknight_dspec_36

package metaknight_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
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

    public dynamic class metaknight_dspec_36 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var beganGround:*;
        public var canSlash:Boolean;
        public var willSlash:Boolean;
        public var controls:Object;

        public function metaknight_dspec_36()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 17, this.frame18, 29, this.frame30, 30, this.frame31, 32, this.frame33, 33, this.frame34, 51, this.frame52, 52, this.frame53);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((this.self) && (SSF2API.isReady())))
            {
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
                this.beganGround = this.self.isOnGround();
            };
            this.canSlash = false;
            this.willSlash = false;
        }

        internal function frame2():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.canSlash = true;
            };
        }

        internal function frame3():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.canSlash = true;
            };
        }

        internal function frame4():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.canSlash = true;
            };
        }

        internal function frame5():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.canSlash = true;
            };
        }

        internal function frame6():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.canSlash = true;
            };
        }

        internal function frame7():*
        {
            this.self.updateAttackStats({"air_ease":-1});
            this.self.setIntangibility(true);
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.canSlash = true;
            };
        }

        internal function frame8():*
        {
            this.self.setYSpeed(0);
            this.controls = this.self.getControls();
            if (((!((this.controls.UP) && (this.controls.DOWN))) && (!((this.controls.LEFT) && (this.controls.RIGHT)))))
            {
                if (((this.controls.UP) && (this.controls.RIGHT)))
                {
                    this.self.faceRight();
                    this.self.setXSpeed(17, false);
                    this.self.setYSpeed(-17);
                }
                else
                {
                    if (((this.controls.RIGHT) && (this.controls.DOWN)))
                    {
                        this.self.faceRight();
                        this.self.setXSpeed(17, false);
                        this.self.setYSpeed(17);
                    }
                    else
                    {
                        if (((this.controls.DOWN) && (this.controls.LEFT)))
                        {
                            this.self.faceLeft();
                            this.self.setXSpeed(17, false);
                            this.self.setYSpeed(17);
                        }
                        else
                        {
                            if (((this.controls.LEFT) && (this.controls.UP)))
                            {
                                this.self.faceLeft();
                                this.self.setXSpeed(17, false);
                                this.self.setYSpeed(-17);
                            }
                            else
                            {
                                if (this.controls.DOWN)
                                {
                                    this.self.setYSpeed(25);
                                }
                                else
                                {
                                    if (this.controls.LEFT)
                                    {
                                        this.self.faceLeft();
                                        this.self.setXSpeed(25, false);
                                    }
                                    else
                                    {
                                        if (this.controls.RIGHT)
                                        {
                                            this.self.faceRight();
                                            this.self.setXSpeed(25, false);
                                        }
                                        else
                                        {
                                            this.self.setYSpeed(-25);
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
            this.self.playAttackSound(1);
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.canSlash = true;
            };
        }

        internal function frame9():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.BUTTON1) && (this.canSlash)))
            {
                this.willSlash = true;
            };
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.canSlash = true;
            };
        }

        internal function frame10():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.BUTTON1) && (this.canSlash)))
            {
                this.willSlash = true;
            };
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.canSlash = true;
            };
        }

        internal function frame11():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.BUTTON1) && (this.canSlash)))
            {
                this.willSlash = true;
            };
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.canSlash = true;
            };
        }

        internal function frame12():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.BUTTON1) && (this.canSlash)))
            {
                this.willSlash = true;
            };
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.canSlash = true;
            };
        }

        internal function frame13():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.BUTTON1) && (this.canSlash)))
            {
                this.willSlash = true;
            };
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.canSlash = true;
            };
        }

        internal function frame14():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.BUTTON1) && (this.canSlash)))
            {
                this.willSlash = true;
            };
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.canSlash = true;
            };
        }

        internal function frame15():*
        {
            this.controls = this.self.getControls();
            if (((this.canSlash) && (this.willSlash)))
            {
                gotoAndPlay("slash");
            };
        }

        internal function frame16():*
        {
            this.self.resetMovement();
            this.self.updateAttackStats({
                "allowControl":true,
                "allowControlGround":false
            });
            this.self.setYSpeed(0);
            this.self.setIntangibility(false);
        }

        internal function frame18():*
        {
        }

        internal function frame30():*
        {
            this.self.endAttack();
        }

        internal function frame31():*
        {
            this.self.resetMovement();
            this.self.updateAttackStats({"air_ease":0});
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame33():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame34():*
        {
            this.self.setIntangibility(false);
        }

        internal function frame52():*
        {
            this.self.updateAttackStats({"air_ease":-1});
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
        }

        internal function frame53():*
        {
            this.self.endAttack();
        }


    }
}//package metaknight_fla

