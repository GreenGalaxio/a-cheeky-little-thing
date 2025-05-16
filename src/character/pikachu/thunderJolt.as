// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//thunderJolt

package 
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

    public dynamic class thunderJolt extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var pos1:Number;
        public var pos2:Number;
        public var pos1y:Number;
        public var pos2y:Number;
        public var projectile:*;
        public var xspeed:Number;
        public var yspeed:Number;
        public var hasTouchedGround:Boolean;
        public var dWall:Boolean;
        public var wasDWall:Boolean;
        public var onCeiling:Boolean;
        public var dir:Boolean;
        public var self:*;
        public var character:*;

        public function thunderJolt()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10);
        }

        internal function frame1():*
        {
            this.projectile = null;
            this.hasTouchedGround = false;
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                this.projectile = this.self;
                if (this.projectile != null)
                {
                    this.dir = this.projectile.isFacingRight();
                    if (this.projectile.isOnGround())
                    {
                        this.hasTouchedGround = true;
                    };
                    this.pos1 = this.x;
                    this.pos1y = this.y;
                    this.yspeed = this.projectile.getYSpeed();
                    this.xspeed = this.projectile.setXSpeed();
                    if (this.onCeiling)
                    {
                        this.projectile.modifyGravity(-1);
                    };
                    if ((((this.pos1 == this.pos2) && (this.projectile.isOnGround())) && (!(this.onCeiling))))
                    {
                        if (this.dir)
                        {
                            this.projectile.setXSpeed(8);
                        }
                        else
                        {
                            this.projectile.setXSpeed(-8);
                        };
                    }
                    else
                    {
                        if ((((this.yspeed > 0) && (this.hasTouchedGround)) && (!(this.onCeiling))))
                        {
                            this.projectile.setXSpeed(0);
                            this.dWall = true;
                            this.wasDWall = true;
                        }
                        else
                        {
                            if (((this.pos1 == this.pos2) && (!(this.wasDWall))))
                            {
                                this.projectile.setYSpeed(-8);
                                this.dWall = false;
                            };
                        };
                    };
                };
            };
        }

        internal function frame2():*
        {
            if (SSF2API != null)
            {
                this.pos2 = this.x;
                this.pos2y = this.y;
                this.xspeed = this.projectile.setXSpeed();
                this.yspeed = this.projectile.getYSpeed();
                this.dir = this.projectile.isFacingRight();
                if (this.projectile.isOnGround())
                {
                    this.hasTouchedGround = true;
                };
                if (this.onCeiling)
                {
                    this.projectile.modifyGravity(-1);
                };
                if ((((this.pos1 == this.pos2) && (this.projectile.isOnGround())) && (!(this.onCeiling))))
                {
                    if (this.dir)
                    {
                        this.projectile.setXSpeed(8);
                    }
                    else
                    {
                        this.projectile.setXSpeed(-8);
                    };
                }
                else
                {
                    if ((((this.yspeed > 0) && (this.hasTouchedGround)) && (!(this.onCeiling))))
                    {
                        this.projectile.setXSpeed(0);
                        this.dWall = true;
                        this.wasDWall = true;
                    }
                    else
                    {
                        if (((this.pos1 == this.pos2) && (!(this.wasDWall))))
                        {
                            this.projectile.setYSpeed(-8);
                            this.dWall = false;
                        };
                    };
                };
            };
        }

        internal function frame3():*
        {
            if (SSF2API != null)
            {
                this.pos1 = this.x;
                this.pos1y = this.y;
                this.xspeed = this.projectile.setXSpeed();
                this.yspeed = this.projectile.getYSpeed();
                this.dir = this.projectile.isFacingRight();
                if (this.projectile.isOnGround())
                {
                    this.hasTouchedGround = true;
                };
                if (this.onCeiling)
                {
                    this.projectile.modifyGravity(-1);
                };
                if ((((this.pos1 == this.pos2) && (this.projectile.isOnGround())) && (!(this.onCeiling))))
                {
                    if (this.dir)
                    {
                        this.projectile.setXSpeed(8);
                    }
                    else
                    {
                        this.projectile.setXSpeed(-8);
                    };
                }
                else
                {
                    if ((((this.yspeed > 0) && (this.hasTouchedGround)) && (!(this.onCeiling))))
                    {
                        this.projectile.setXSpeed(0);
                        this.dWall = true;
                        this.wasDWall = true;
                    }
                    else
                    {
                        if (((this.pos1 == this.pos2) && (!(this.wasDWall))))
                        {
                            this.projectile.setYSpeed(-8);
                            this.dWall = false;
                        }
                        else
                        {
                            if ((((this.pos1 == this.pos2) && (this.projectile.isOnGround())) && (!(this.onCeiling))))
                            {
                                if (this.dir)
                                {
                                    this.projectile.setXSpeed(8);
                                }
                                else
                                {
                                    this.projectile.setXSpeed(-8);
                                };
                                this.wasDWall = false;
                            }
                            else
                            {
                                if ((((this.yspeed > 0) && (this.hasTouchedGround)) && (!(this.onCeiling))))
                                {
                                    this.projectile.setXSpeed(0);
                                    this.dWall = true;
                                    this.wasDWall = true;
                                };
                            };
                        };
                    };
                };
            };
        }

        internal function frame4():*
        {
            if (SSF2API != null)
            {
                this.pos2 = this.x;
                this.pos2y = this.y;
                this.xspeed = this.projectile.setXSpeed();
                this.yspeed = this.projectile.getYSpeed();
                this.dir = this.projectile.isFacingRight();
                if (this.projectile.isOnGround())
                {
                    this.hasTouchedGround = true;
                };
                if (this.onCeiling)
                {
                    this.projectile.modifyGravity(-1);
                };
                if ((((this.pos1 == this.pos2) && (this.projectile.isOnGround())) && (!(this.onCeiling))))
                {
                    if (this.dir)
                    {
                        this.projectile.setXSpeed(8);
                    }
                    else
                    {
                        this.projectile.setXSpeed(-8);
                    };
                }
                else
                {
                    if ((((this.yspeed > 0) && (this.hasTouchedGround)) && (!(this.onCeiling))))
                    {
                        this.projectile.setXSpeed(0);
                        this.dWall = true;
                        this.wasDWall = true;
                    }
                    else
                    {
                        if (((this.pos1 == this.pos2) && (!(this.wasDWall))))
                        {
                            this.projectile.setYSpeed(-8);
                            this.dWall = false;
                        }
                        else
                        {
                            if (((!(this.onCeiling)) && (this.wasDWall)))
                            {
                                if (MovieClip(root).hitTestPoint((parent.x - this.width), this.y))
                                {
                                    if (this.dir)
                                    {
                                        this.projectile.setXSpeed(-8);
                                    }
                                    else
                                    {
                                        this.projectile.setXSpeed(8);
                                    };
                                    this.onCeiling = true;
                                    this.wasDWall = false;
                                };
                            };
                        };
                    };
                };
            };
        }

        internal function frame5():*
        {
            if (SSF2API != null)
            {
                this.pos1 = this.x;
                this.pos1y = this.y;
                this.xspeed = this.projectile.setXSpeed();
                this.yspeed = this.projectile.getYSpeed();
                this.dir = this.projectile.isFacingRight();
                if (this.projectile.isOnGround())
                {
                    this.hasTouchedGround = true;
                };
                if (this.onCeiling)
                {
                    this.projectile.modifyGravity(-1);
                };
                if ((((this.pos1 == this.pos2) && (this.projectile.isOnGround())) && (!(this.onCeiling))))
                {
                    if (this.dir)
                    {
                        this.projectile.setXSpeed(8);
                    }
                    else
                    {
                        this.projectile.setXSpeed(-8);
                    };
                }
                else
                {
                    if ((((this.yspeed > 0) && (this.hasTouchedGround)) && (!(this.onCeiling))))
                    {
                        this.projectile.setXSpeed(0);
                        this.dWall = true;
                        this.wasDWall = true;
                    }
                    else
                    {
                        if (((this.pos1 == this.pos2) && (!(this.wasDWall))))
                        {
                            this.projectile.setYSpeed(-8);
                            this.dWall = false;
                        };
                    };
                };
                if (((this.pos1 == this.pos2) && (!(this.wasDWall))))
                {
                    this.projectile.setYSpeed(-8);
                    this.dWall = false;
                }
                else
                {
                    if ((((this.pos1 == this.pos2) && (this.projectile.isOnGround())) && (!(this.onCeiling))))
                    {
                        if (this.dir)
                        {
                            this.projectile.setXSpeed(8);
                        }
                        else
                        {
                            this.projectile.setXSpeed(-8);
                        };
                        this.wasDWall = false;
                    }
                    else
                    {
                        if ((((this.yspeed > 0) && (this.hasTouchedGround)) && (!(this.onCeiling))))
                        {
                            this.projectile.setXSpeed(0);
                            this.dWall = true;
                            this.wasDWall = true;
                        };
                    };
                };
            };
        }

        internal function frame6():*
        {
            if (SSF2API != null)
            {
                this.pos2 = this.x;
                this.pos2y = this.y;
                this.xspeed = this.projectile.setXSpeed();
                this.yspeed = this.projectile.getYSpeed();
                this.dir = this.projectile.isFacingRight();
                if (this.projectile.isOnGround())
                {
                    this.hasTouchedGround = true;
                };
                if (this.onCeiling)
                {
                    this.projectile.modifyGravity(-1);
                };
                if ((((this.pos1 == this.pos2) && (this.projectile.isOnGround())) && (!(this.onCeiling))))
                {
                    if (this.dir)
                    {
                        this.projectile.setXSpeed(8);
                    }
                    else
                    {
                        this.projectile.setXSpeed(-8);
                    };
                }
                else
                {
                    if ((((this.yspeed > 0) && (this.hasTouchedGround)) && (!(this.onCeiling))))
                    {
                        this.projectile.setXSpeed(0);
                        this.dWall = true;
                        this.wasDWall = true;
                    }
                    else
                    {
                        if (((this.pos1 == this.pos2) && (!(this.wasDWall))))
                        {
                            this.projectile.setYSpeed(-8);
                            this.dWall = false;
                        }
                        else
                        {
                            if (((!(this.onCeiling)) && (this.wasDWall)))
                            {
                                if (MovieClip(root).hitTestPoint((parent.x - this.width), this.y))
                                {
                                    if (this.dir)
                                    {
                                        this.projectile.setXSpeed(-8);
                                    }
                                    else
                                    {
                                        this.projectile.setXSpeed(8);
                                    };
                                    this.onCeiling = true;
                                    this.wasDWall = false;
                                };
                            };
                        };
                    };
                };
            };
        }

        internal function frame7():*
        {
            if (SSF2API != null)
            {
                this.pos1 = this.x;
                this.pos1y = this.y;
                this.xspeed = this.projectile.setXSpeed();
                this.yspeed = this.projectile.getYSpeed();
                this.dir = this.projectile.isFacingRight();
                if (this.projectile.isOnGround())
                {
                    this.hasTouchedGround = true;
                };
                if (this.onCeiling)
                {
                    this.projectile.modifyGravity(-1);
                };
                if ((((this.pos1 == this.pos2) && (this.projectile.isOnGround())) && (!(this.onCeiling))))
                {
                    if (this.dir)
                    {
                        this.projectile.setXSpeed(8);
                    }
                    else
                    {
                        this.projectile.setXSpeed(-8);
                    };
                }
                else
                {
                    if ((((this.yspeed > 0) && (this.hasTouchedGround)) && (!(this.onCeiling))))
                    {
                        this.projectile.setXSpeed(0);
                        this.dWall = true;
                        this.wasDWall = true;
                    }
                    else
                    {
                        if (((this.pos1 == this.pos2) && (!(this.wasDWall))))
                        {
                            this.projectile.setYSpeed(-8);
                            this.dWall = false;
                        }
                        else
                        {
                            if (((this.pos1 == this.pos2) && (!(this.wasDWall))))
                            {
                                this.projectile.setYSpeed(-8);
                                this.dWall = false;
                            }
                            else
                            {
                                if ((((this.pos1 == this.pos2) && (this.projectile.isOnGround())) && (!(this.onCeiling))))
                                {
                                    if (this.dir)
                                    {
                                        this.projectile.setXSpeed(8);
                                    }
                                    else
                                    {
                                        this.projectile.setXSpeed(-8);
                                    };
                                    this.wasDWall = false;
                                }
                                else
                                {
                                    if ((((this.yspeed > 0) && (this.hasTouchedGround)) && (!(this.onCeiling))))
                                    {
                                        this.projectile.setXSpeed(0);
                                        this.dWall = true;
                                        this.wasDWall = true;
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        internal function frame8():*
        {
            if (SSF2API != null)
            {
                this.pos2 = this.x;
                this.pos2y = this.y;
                this.xspeed = this.projectile.setXSpeed();
                this.yspeed = this.projectile.getYSpeed();
                this.dir = this.projectile.isFacingRight();
                if (this.projectile.isOnGround())
                {
                    this.hasTouchedGround = true;
                };
                if (this.onCeiling)
                {
                    this.projectile.modifyGravity(-1);
                };
                if ((((this.pos1 == this.pos2) && (this.projectile.isOnGround())) && (!(this.onCeiling))))
                {
                    if (this.dir)
                    {
                        this.projectile.setXSpeed(8);
                    }
                    else
                    {
                        this.projectile.setXSpeed(-8);
                    };
                }
                else
                {
                    if (((this.pos1 == this.pos2) && (!(this.wasDWall))))
                    {
                        this.projectile.setYSpeed(-8);
                        this.dWall = false;
                    }
                    else
                    {
                        if ((((this.yspeed > 0) && (this.hasTouchedGround)) && (!(this.onCeiling))))
                        {
                            this.projectile.setXSpeed(0);
                            this.dWall = true;
                            this.wasDWall = true;
                        }
                        else
                        {
                            if (((!(this.onCeiling)) && (this.wasDWall)))
                            {
                                if (MovieClip(root).hitTestPoint((parent.x - this.width), this.y))
                                {
                                    if (this.dir)
                                    {
                                        this.projectile.setXSpeed(-8);
                                    }
                                    else
                                    {
                                        this.projectile.setXSpeed(8);
                                    };
                                    this.onCeiling = true;
                                    this.wasDWall = false;
                                };
                            };
                        };
                    };
                };
            };
        }

        internal function frame9():*
        {
            if (SSF2API != null)
            {
                this.pos1 = this.x;
                this.pos1y = this.y;
                this.xspeed = this.projectile.setXSpeed();
                this.yspeed = this.projectile.getYSpeed();
                this.dir = this.projectile.isFacingRight();
                if (this.projectile.isOnGround())
                {
                    this.hasTouchedGround = true;
                };
                if (this.onCeiling)
                {
                    this.projectile.modifyGravity(-1);
                };
                if ((((this.pos1 == this.pos2) && (this.projectile.isOnGround())) && (!(this.onCeiling))))
                {
                    if (this.dir)
                    {
                        this.projectile.setXSpeed(8);
                    }
                    else
                    {
                        this.projectile.setXSpeed(-8);
                    };
                }
                else
                {
                    if ((((this.yspeed > 0) && (this.hasTouchedGround)) && (!(this.onCeiling))))
                    {
                        this.projectile.setXSpeed(0);
                        this.dWall = true;
                        this.wasDWall = true;
                    }
                    else
                    {
                        if (((this.pos1 == this.pos2) && (!(this.wasDWall))))
                        {
                            this.projectile.setYSpeed(-8);
                            this.dWall = false;
                        }
                        else
                        {
                            if (((this.pos1 == this.pos2) && (!(this.wasDWall))))
                            {
                                this.projectile.setYSpeed(-8);
                                this.dWall = false;
                            }
                            else
                            {
                                if ((((this.pos1 == this.pos2) && (this.projectile.isOnGround())) && (!(this.onCeiling))))
                                {
                                    if (this.dir)
                                    {
                                        this.projectile.setXSpeed(8);
                                    }
                                    else
                                    {
                                        this.projectile.setXSpeed(-8);
                                    };
                                    this.wasDWall = false;
                                }
                                else
                                {
                                    if ((((this.yspeed > 0) && (this.hasTouchedGround)) && (!(this.onCeiling))))
                                    {
                                        this.projectile.setXSpeed(0);
                                        this.dWall = true;
                                        this.wasDWall = true;
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
            if (SSF2API != null)
            {
                this.pos2 = this.x;
                this.pos2y = this.y;
                this.xspeed = this.projectile.setXSpeed();
                this.yspeed = this.projectile.getYSpeed();
                this.dir = this.projectile.isFacingRight();
                if (this.projectile.isOnGround())
                {
                    this.hasTouchedGround = true;
                };
                if (this.onCeiling)
                {
                    this.projectile.modifyGravity(-1);
                };
                if ((((this.pos1 == this.pos2) && (this.projectile.isOnGround())) && (!(this.onCeiling))))
                {
                    if (this.dir)
                    {
                        this.projectile.setXSpeed(8);
                    }
                    else
                    {
                        this.projectile.setXSpeed(-8);
                    };
                }
                else
                {
                    if ((((this.yspeed > 0) && (this.hasTouchedGround)) && (!(this.onCeiling))))
                    {
                        this.projectile.setXSpeed(0);
                        this.dWall = true;
                        this.wasDWall = true;
                    }
                    else
                    {
                        if (((this.pos1 == this.pos2) && (!(this.wasDWall))))
                        {
                            this.projectile.setYSpeed(-8);
                            this.dWall = false;
                        };
                    };
                };
                gotoAndPlay("beginning");
            };
        }


    }
}//package 

