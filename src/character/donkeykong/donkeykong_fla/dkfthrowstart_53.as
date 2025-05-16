// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//donkeykong_fla.dkfthrowstart_53

package donkeykong_fla
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

    public dynamic class dkfthrowstart_53 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;
        public var theOpponent:*;
        public var controls2:Object;
        public var formerControl:Object;
        public var endTimer:int;
        public var mashInfluence:*;
        public var controls:Object;
        public var ground:Object;
        public var facing:Boolean;
        public var origDirection:Boolean;
        public var state:*;
        public var nextState:*;
        public var frameForState:*;
        public var timer:*;
        public var stateMap:*;

        public function dkfthrowstart_53()
        {
            addFrameScript(0, this.frame1, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 39, this.frame40, 40, this.frame41, 44, this.frame45, 47, this.frame48, 48, this.frame49, 51, this.frame52, 52, this.frame53, 56, this.frame57, 66, this.frame67, 67, this.frame68, 70, this.frame71);
        }

        public function getFree():void
        {
            this.endTimer--;
            if (this.endTimer <= 0)
            {
                SSF2API.destroyTimer(this.self, this.getFree);
                gotoAndPlay("end");
                return;
            };
            this.controls2 = this.theOpponent.getControls();
            if (((this.controls2.UP) && (!(this.formerControl == "up"))))
            {
                this.formerControl = "up";
                this.endTimer = (this.endTimer - this.mashInfluence);
            }
            else
            {
                if (((this.controls2.DOWN) && (!(this.formerControl == "down"))))
                {
                    this.formerControl = "down";
                    this.endTimer = (this.endTimer - this.mashInfluence);
                }
                else
                {
                    if (((this.controls2.LEFT) && (!(this.formerControl == "left"))))
                    {
                        this.formerControl = "left";
                        this.endTimer = (this.endTimer - this.mashInfluence);
                    }
                    else
                    {
                        if (((this.controls2.RIGHT) && (!(this.formerControl == "right"))))
                        {
                            this.formerControl = "right";
                            this.endTimer = (this.endTimer - this.mashInfluence);
                        }
                        else
                        {
                            if (((this.controls2.BUTTON1) && (!(this.formerControl == "button1"))))
                            {
                                this.formerControl = "button1";
                                this.endTimer = (this.endTimer - this.mashInfluence);
                            }
                            else
                            {
                                if (((this.controls2.BUTTON2) && (!(this.formerControl == "button2"))))
                                {
                                    this.formerControl = "button2";
                                    this.endTimer = (this.endTimer - this.mashInfluence);
                                }
                                else
                                {
                                    if (((this.controls2.GRAB) && (!(this.formerControl == "grab"))))
                                    {
                                        this.formerControl = "grab";
                                        this.endTimer = (this.endTimer - this.mashInfluence);
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        public function refreshControls():void
        {
            this.controls = this.self.getControls();
        }

        public function fThrow():void
        {
            this.refreshControls();
            if (this.self.isOnGround())
            {
                this.self.updateAttackStats({"xSpeedCap":2});
            }
            else
            {
                this.self.updateAttackStats({"xSpeedCap":-1});
            };
            if (this.state == "standing")
            {
                if (((this.controls.BUTTON1) || (this.controls.BUTTON2)))
                {
                    this.nextState = "throwing";
                }
                else
                {
                    if ((((this.controls.RIGHT) && (!(this.controls.LEFT))) || ((this.controls.LEFT) && (!(this.controls.RIGHT)))))
                    {
                        if (this.controls.RIGHT)
                        {
                            this.self.faceRight();
                        }
                        else
                        {
                            if (this.controls.LEFT)
                            {
                                this.self.faceLeft();
                            };
                        };
                        this.nextState = "walking";
                    }
                    else
                    {
                        if (this.controls.JUMP)
                        {
                            this.nextState = "jumping";
                        };
                    };
                };
            }
            else
            {
                if (this.state == "walking")
                {
                    if (((this.controls.BUTTON1) || (this.controls.BUTTON2)))
                    {
                        this.nextState = "throwing";
                    }
                    else
                    {
                        if (!this.self.isOnGround())
                        {
                            this.nextState = "jumping";
                        }
                        else
                        {
                            if (((!(this.controls.RIGHT)) && (!(this.controls.LEFT))))
                            {
                                this.nextState = "standing";
                            }
                            else
                            {
                                if (this.controls.JUMP)
                                {
                                    this.nextState = "jumping";
                                }
                                else
                                {
                                    if (this.controls.RIGHT)
                                    {
                                        this.self.faceRight();
                                    }
                                    else
                                    {
                                        if (this.controls.LEFT)
                                        {
                                            this.self.faceLeft();
                                        };
                                    };
                                };
                            };
                        };
                    };
                }
                else
                {
                    if (this.state == "jumping")
                    {
                        if (((this.controls.BUTTON1) || (this.controls.BUTTON2)))
                        {
                            this.nextState = "throwing";
                        };
                    }
                    else
                    {
                        if (this.state != "landing")
                        {
                            if (this.state == "throwing")
                            {
                            };
                        };
                    };
                };
            };
            if (this.state != this.nextState)
            {
                gotoAndPlay(this.stateMap[this.nextState]);
                this.state = this.nextState;
            };
        }

        public function landPlease(_arg_1:*=null):void
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.landPlease);
            this.gotoAndPlay("land");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((this.self) && (SSF2API.isReady())))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
            this.endTimer = 90;
            this.mashInfluence = 2;
            if (((this.self) && (SSF2API.isReady())))
            {
                this.theOpponent = this.self.getGlobalVariable("opponent");
                if (this.theOpponent == null)
                {
                    SSF2API.print("There is no opponent! Eek!");
                };
                this.controls2 = this.theOpponent.getControls();
                this.endTimer = (90 + (this.theOpponent.getDamage() / 4));
            };
            this.state = "standing";
            this.nextState = this.state;
            this.frameForState = null;
            this.timer = 0;
            this.stateMap = new Array();
            if (((this.self) && (SSF2API.isReady())))
            {
                this.controls = this.self.getControls();
                this.ground = this.self.isOnGround();
                SSF2API.playSound("dk_attack1");
                this.self.updateAttackStats({"allowControl":false});
                this.facing = this.self.isFacingRight();
                this.origDirection = this.facing;
            };
        }

        internal function frame14():*
        {
            this.self.updateAttackStats({
                "allowControl":true,
                "allowJump":true
            });
            this.stateMap["standing"] = "standing";
            this.stateMap["walking"] = "moving";
            this.stateMap["jumping"] = "jump";
            this.stateMap["landing"] = "land";
            this.stateMap["throwing"] = "finish";
            SSF2API.createTimer(this.self, 1, 0, this.fThrow);
            SSF2API.createTimer(this.self, 1, 0, this.getFree);
        }

        internal function frame15():*
        {
            this.state = "standing";
            this.self.updateAttackStats({"allowJump":true});
            SSF2API.print(this.state);
        }

        internal function frame16():*
        {
            gotoAndPlay("standing");
        }

        internal function frame17():*
        {
            this.state = "walking";
            SSF2API.print(this.state);
        }

        internal function frame40():*
        {
            gotoAndPlay("moving");
        }

        internal function frame41():*
        {
            this.state = "jumping";
            SSF2API.print(this.state);
        }

        internal function frame45():*
        {
            this.state = "jumping";
            SSF2API.print(this.state);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.landPlease);
        }

        internal function frame48():*
        {
            gotoAndPlay("jumprepeat");
        }

        internal function frame49():*
        {
            SSF2API.shakeCamera(9);
            this.state = "landing";
            SSF2API.print(this.state);
        }

        internal function frame52():*
        {
            SSF2API.print("Imma standing");
            gotoAndPlay("standing");
        }

        internal function frame53():*
        {
            SSF2API.destroyTimer(this.self, this.getFree);
            this.self.updateAttackStats({
                "allowControl":false,
                "allowJump":false
            });
            SSF2API.destroyTimer(this.self, this.fThrow);
            SSF2API.destroyTimer(this.self, this.getFree);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.landPlease);
            this.state = "throwing";
        }

        internal function frame57():*
        {
            if ((((this.playsound > 0.2) && (this.playsound <= 0.4)) && (!(this.audio == 1))))
            {
                this.self.playVoiceSound(1);
                this.self.setGlobalVariable("audio", 1);
            };
            if ((((this.playsound > 0.4) && (this.playsound <= 0.6)) && (!(this.audio == 2))))
            {
                this.self.playVoiceSound(2);
                this.self.setGlobalVariable("audio", 2);
            };
            if ((((this.playsound > 0.6) && (this.playsound <= 0.8)) && (!(this.audio == 3))))
            {
                this.self.playVoiceSound(3);
                this.self.setGlobalVariable("audio", 3);
            };
            if ((((this.playsound > 0.8) && (this.playsound <= 1)) && (!(this.audio == 4))))
            {
                this.self.playVoiceSound(4);
                this.self.setGlobalVariable("audio", 4);
            };
            SSF2API.playSound("brawl_dk_swing_H");
            SSF2API.shakeCamera(9);
        }

        internal function frame67():*
        {
            this.self.endAttack();
        }

        internal function frame68():*
        {
            SSF2API.destroyTimer(this.self, this.fThrow);
            SSF2API.destroyTimer(this.self, this.getFree);
            this.self.updateAttackStats({
                "allowControl":false,
                "allowJump":false
            });
        }

        internal function frame71():*
        {
            this.self.grabReleaseOpponent();
            this.self.grabRelease();
        }


    }
}//package donkeykong_fla

