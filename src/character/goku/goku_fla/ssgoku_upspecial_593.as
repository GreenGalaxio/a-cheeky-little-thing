// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.ssgoku_upspecial_593

package goku_fla
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

    public dynamic class ssgoku_upspecial_593 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var controls:Object;
        public var continuePlaying:Boolean;
        public var handled:Boolean;
        public var restart:Boolean;
        public var speed:Number;
        public var newStats:Object;
        public var newStats2:Object;

        public function ssgoku_upspecial_593()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 6, this.frame7, 9, this.frame10, 10, this.frame11, 16, this.frame17, 17, this.frame18, 18, this.frame19, 21, this.frame22);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.controls = null;
                this.continuePlaying = false;
                this.handled = true;
                this.restart = false;
                this.speed = 50;
            };
        }

        internal function frame6():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame7():*
        {
            this.self.setYSpeed(0);
            this.controls = this.self.getControls();
            if (((!((this.controls.UP) && (this.controls.DOWN))) && (!((this.controls.LEFT) && (this.controls.RIGHT)))))
            {
                if (((this.controls.UP) && (this.controls.RIGHT)))
                {
                    this.self.faceRight();
                    this.self.setXSpeed(35.3553, false);
                    this.self.setYSpeed(-35.3553);
                }
                else
                {
                    if (((this.controls.RIGHT) && (this.controls.DOWN)))
                    {
                        this.self.faceRight();
                        this.self.updateAttackStats({"air_ease":-1});
                        this.self.setXSpeed(35.3553, false);
                        this.self.setYSpeed(35.3553);
                    }
                    else
                    {
                        if (((this.controls.DOWN) && (this.controls.LEFT)))
                        {
                            this.self.faceLeft();
                            this.self.updateAttackStats({"air_ease":-1});
                            this.self.setXSpeed(35.3553, false);
                            this.self.setYSpeed(35.3553);
                        }
                        else
                        {
                            if (((this.controls.LEFT) && (this.controls.UP)))
                            {
                                this.self.faceLeft();
                                this.self.setXSpeed(35.3553, false);
                                this.self.setYSpeed(-35.3553);
                            }
                            else
                            {
                                if (this.controls.DOWN)
                                {
                                    this.self.updateAttackStats({"air_ease":-1});
                                    this.self.setYSpeed(50);
                                }
                                else
                                {
                                    if (this.controls.LEFT)
                                    {
                                        this.self.faceLeft();
                                        this.self.setXSpeed(50, false);
                                    }
                                    else
                                    {
                                        if (this.controls.RIGHT)
                                        {
                                            this.self.faceRight();
                                            this.self.setXSpeed(50, false);
                                        }
                                        else
                                        {
                                            this.self.setYSpeed(-50);
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        internal function frame10():*
        {
            this.self.setXSpeed(0, false);
            this.self.setYSpeed(0);
            if (((!(this.continuePlaying == true)) && (!(this.restart))))
            {
                this.self.endAttack();
            }
            else
            {
                if (this.restart)
                {
                    gotoAndPlay("begin");
                };
            };
        }

        internal function frame11():*
        {
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            this.self.updateAttackStats({"air_ease":0});
            this.newStats = {
                "direction":15,
                "power":10,
                "hitStun":5,
                "hitLag":14
            };
            this.self.updateAttackBoxStats(1, this.newStats);
            this.self.refreshAttackID();
        }

        internal function frame17():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame18():*
        {
            if (((!(this.continuePlaying == true)) && (!(this.restart))))
            {
                this.self.endAttack();
            }
            else
            {
                if (this.restart)
                {
                    gotoAndPlay("begin");
                };
            };
        }

        internal function frame19():*
        {
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            this.self.updateAttackStats({"air_ease":0});
            this.newStats2 = {
                "direction":260,
                "power":90,
                "hitLag":-2,
                "hitStun":5,
                "selfHitStun":4
            };
            this.self.updateAttackBoxStats(1, this.newStats2);
            this.self.refreshAttackID();
        }

        internal function frame22():*
        {
            this.self.endAttack();
        }


    }
}//package goku_fla

