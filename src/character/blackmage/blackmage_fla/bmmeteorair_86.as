// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.bmmeteorair_86

package blackmage_fla
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

    public dynamic class bmmeteorair_86 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var controls:Object;
        public var xframe:String;
        public var projectile:*;
        public var sizeRatio:*;
        public var facingRight:*;

        public function bmmeteorair_86()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22, 22, this.frame23, 23, this.frame24, 24, this.frame25, 25, this.frame26, 26, this.frame27, 27, this.frame28, 28, this.frame29, 35, this.frame36, 42, this.frame43);
        }

        public function projectileHit(_arg_1:*):*
        {
            SSF2API.removeEventListener(this.projectile, SSF2Event.PROJ_DESTROYED, this.projectileHit);
            if (((SSF2API.getCharacter(this.self.getID()).getMC().currentFrameLabel == "b_down") || (SSF2API.getCharacter(this.self.getID()).getMC().currentFrameLabel == "b_down_air")))
            {
                this.self.endAttack();
            };
        }

        public function killProjectile(_arg_1:*):*
        {
            this.self.getCurrentProjectile().destroy();
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT, this.killProjectile);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if (((parent) && (SSF2API.isReady())))
            {
                this.self.setGlobalVariable("meteorFrame", null);
            };
            if (((parent) && (SSF2API.isReady())))
            {
                this.controls = this.self.getControls();
                this.xframe = null;
                this.projectile = null;
                this.sizeRatio = 1;
                SSF2API.playSound("bm_FS_spellcast");
            };
        }

        internal function frame2():*
        {
            this.self.setGlobalVariable("meteorFrame", "airStart");
        }

        internal function frame4():*
        {
            this.self.fireProjectile("meteorair");
            this.projectile = this.self.getCurrentProjectile();
            this.self.setGlobalVariable("meteor", this.projectile);
            SSF2API.addEventListener(this.projectile, SSF2Event.PROJ_DESTROYED, this.projectileHit);
        }

        internal function frame5():*
        {
            this.facingRight = this.self.isFacingRight();
            if (((this.facingRight) && (!(this.self.getGlobalVariable("meteor") == null))))
            {
                this.self.getGlobalVariable("meteor").getMC().x = (parent.x + 14);
                this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getGlobalVariable("meteor") == null))))
                {
                    this.self.getGlobalVariable("meteor").getMC().x = (parent.x - 14);
                    this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
                };
            };
            if (((this.self.getGlobalVariable("meteor") == null) && (!(this.self.getGlobalVariable("meteor").isDead()))))
            {
                this.gotoAndPlay("broken");
            };
            this.xframe = "charging";
        }

        internal function frame6():*
        {
            if (((this.facingRight) && (!(this.self.getGlobalVariable("meteor") == null))))
            {
                this.self.getGlobalVariable("meteor").getMC().x = (parent.x + 14);
                this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getGlobalVariable("meteor") == null))))
                {
                    this.self.getGlobalVariable("meteor").getMC().x = (parent.x - 14);
                    this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
                };
            };
        }

        internal function frame7():*
        {
            if (((this.facingRight) && (!(this.self.getGlobalVariable("meteor") == null))))
            {
                this.self.getGlobalVariable("meteor").getMC().x = (parent.x + 14);
                this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getGlobalVariable("meteor") == null))))
                {
                    this.self.getGlobalVariable("meteor").getMC().x = (parent.x - 14);
                    this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
                };
            };
        }

        internal function frame8():*
        {
            if (((this.facingRight) && (!(this.self.getGlobalVariable("meteor") == null))))
            {
                this.self.getGlobalVariable("meteor").getMC().x = (parent.x + 14);
                this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getGlobalVariable("meteor") == null))))
                {
                    this.self.getGlobalVariable("meteor").getMC().x = (parent.x - 14);
                    this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
                };
            };
        }

        internal function frame9():*
        {
            if (((this.facingRight) && (!(this.self.getGlobalVariable("meteor") == null))))
            {
                this.self.getGlobalVariable("meteor").getMC().x = (parent.x + 14);
                this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getGlobalVariable("meteor") == null))))
                {
                    this.self.getGlobalVariable("meteor").getMC().x = (parent.x - 14);
                    this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
                };
            };
            if (this.projectile != null)
            {
                this.sizeRatio = (this.sizeRatio + 0.1);
                this.projectile.getMC().scaleX = this.sizeRatio;
                this.projectile.getMC().scaleY = this.sizeRatio;
                this.projectile.updateAttackBoxStats(1, {"damage":(this.projectile.getAttackBoxStat(1, "damage") + 1)});
            };
            this.gotoAndPlay("charging");
        }

        internal function frame10():*
        {
            if (((this.facingRight) && (!(this.self.getGlobalVariable("meteor") == null))))
            {
                this.self.getGlobalVariable("meteor").getMC().x = (parent.x + 14);
                this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getGlobalVariable("meteor") == null))))
                {
                    this.self.getGlobalVariable("meteor").getMC().x = (parent.x - 14);
                    this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
                };
            };
        }

        internal function frame11():*
        {
            if (((this.facingRight) && (!(this.self.getGlobalVariable("meteor") == null))))
            {
                this.self.getGlobalVariable("meteor").getMC().x = (parent.x + 14);
                this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getGlobalVariable("meteor") == null))))
                {
                    this.self.getGlobalVariable("meteor").getMC().x = (parent.x - 14);
                    this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
                };
            };
        }

        internal function frame12():*
        {
            if (((this.facingRight) && (!(this.self.getGlobalVariable("meteor") == null))))
            {
                this.self.getGlobalVariable("meteor").getMC().x = (parent.x + 14);
                this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getGlobalVariable("meteor") == null))))
                {
                    this.self.getGlobalVariable("meteor").getMC().x = (parent.x - 14);
                    this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
                };
            };
        }

        internal function frame13():*
        {
            if (((this.facingRight) && (!(this.self.getGlobalVariable("meteor") == null))))
            {
                this.self.getGlobalVariable("meteor").getMC().x = (parent.x + 14);
                this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getGlobalVariable("meteor") == null))))
                {
                    this.self.getGlobalVariable("meteor").getMC().x = (parent.x - 14);
                    this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
                };
            };
        }

        internal function frame14():*
        {
            if (((this.facingRight) && (!(this.self.getGlobalVariable("meteor") == null))))
            {
                this.self.getGlobalVariable("meteor").getMC().x = (parent.x + 14);
                this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getGlobalVariable("meteor") == null))))
                {
                    this.self.getGlobalVariable("meteor").getMC().x = (parent.x - 14);
                    this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
                };
            };
        }

        internal function frame15():*
        {
            if (((this.facingRight) && (!(this.self.getGlobalVariable("meteor") == null))))
            {
                this.self.getGlobalVariable("meteor").getMC().x = (parent.x + 14);
                this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getGlobalVariable("meteor") == null))))
                {
                    this.self.getGlobalVariable("meteor").getMC().x = (parent.x - 14);
                    this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
                };
            };
        }

        internal function frame16():*
        {
            if (((this.facingRight) && (!(this.self.getGlobalVariable("meteor") == null))))
            {
                this.self.getGlobalVariable("meteor").getMC().x = (parent.x + 14);
                this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getGlobalVariable("meteor") == null))))
                {
                    this.self.getGlobalVariable("meteor").getMC().x = (parent.x - 14);
                    this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
                };
            };
            if (((this.self.getGlobalVariable("meteor") == null) && (!(this.self.getGlobalVariable("meteor").isDead()))))
            {
                this.gotoAndPlay("broken");
            }
            else
            {
                this.self.getGlobalVariable("meteor").setYSpeed(0);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT, this.killProjectile);
            };
        }

        internal function frame17():*
        {
            if (((this.facingRight) && (!(this.self.getGlobalVariable("meteor") == null))))
            {
                this.self.getGlobalVariable("meteor").getMC().x = (parent.x + 14);
                this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getGlobalVariable("meteor") == null))))
                {
                    this.self.getGlobalVariable("meteor").getMC().x = (parent.x - 14);
                    this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
                };
            };
        }

        internal function frame18():*
        {
            if (((this.facingRight) && (!(this.self.getGlobalVariable("meteor") == null))))
            {
                this.self.getGlobalVariable("meteor").getMC().x = (parent.x + 14);
                this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getGlobalVariable("meteor") == null))))
                {
                    this.self.getGlobalVariable("meteor").getMC().x = (parent.x - 14);
                    this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
                };
            };
            this.xframe = "attack";
            SSF2API.removeEventListener(this.projectile, SSF2Event.PROJ_DESTROYED, this.projectileHit);
        }

        internal function frame19():*
        {
            if (((this.facingRight) && (!(this.self.getGlobalVariable("meteor") == null))))
            {
                this.self.getGlobalVariable("meteor").getMC().x = (parent.x + 14);
                this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getGlobalVariable("meteor") == null))))
                {
                    this.self.getGlobalVariable("meteor").getMC().x = (parent.x - 14);
                    this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
                };
            };
            this.self.setGlobalVariable("meteorFrame", "a");
        }

        internal function frame20():*
        {
            if (((this.facingRight) && (!(this.self.getGlobalVariable("meteor") == null))))
            {
                this.self.getGlobalVariable("meteor").getMC().x = (parent.x + 14);
                this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getGlobalVariable("meteor") == null))))
                {
                    this.self.getGlobalVariable("meteor").getMC().x = (parent.x - 14);
                    this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
                };
            };
        }

        internal function frame21():*
        {
            if (((this.facingRight) && (!(this.self.getGlobalVariable("meteor") == null))))
            {
                this.self.getGlobalVariable("meteor").getMC().x = (parent.x + 14);
                this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getGlobalVariable("meteor") == null))))
                {
                    this.self.getGlobalVariable("meteor").getMC().x = (parent.x - 14);
                    this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
                };
            };
        }

        internal function frame22():*
        {
            if (((this.facingRight) && (!(this.self.getGlobalVariable("meteor") == null))))
            {
                this.self.getGlobalVariable("meteor").getMC().x = (parent.x + 14);
                this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getGlobalVariable("meteor") == null))))
                {
                    this.self.getGlobalVariable("meteor").getMC().x = (parent.x - 14);
                    this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
                };
            };
            this.self.setGlobalVariable("meteorFrame", "b");
        }

        internal function frame23():*
        {
            if (((this.facingRight) && (!(this.self.getGlobalVariable("meteor") == null))))
            {
                this.self.getGlobalVariable("meteor").getMC().x = (parent.x + 14);
                this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getGlobalVariable("meteor") == null))))
                {
                    this.self.getGlobalVariable("meteor").getMC().x = (parent.x - 14);
                    this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
                };
            };
        }

        internal function frame24():*
        {
            if (((this.facingRight) && (!(this.self.getGlobalVariable("meteor") == null))))
            {
                this.self.getGlobalVariable("meteor").getMC().x = (parent.x + 14);
                this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getGlobalVariable("meteor") == null))))
                {
                    this.self.getGlobalVariable("meteor").getMC().x = (parent.x - 14);
                    this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
                };
            };
        }

        internal function frame25():*
        {
            if (((this.facingRight) && (!(this.self.getGlobalVariable("meteor") == null))))
            {
                this.self.getGlobalVariable("meteor").getMC().x = (parent.x + 14);
                this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getGlobalVariable("meteor") == null))))
                {
                    this.self.getGlobalVariable("meteor").getMC().x = (parent.x - 14);
                    this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
                };
            };
            this.self.setGlobalVariable("meteorFrame", "c");
        }

        internal function frame26():*
        {
            if (((this.facingRight) && (!(this.self.getGlobalVariable("meteor") == null))))
            {
                this.self.getGlobalVariable("meteor").getMC().x = (parent.x + 14);
                this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getGlobalVariable("meteor") == null))))
                {
                    this.self.getGlobalVariable("meteor").getMC().x = (parent.x - 14);
                    this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
                };
            };
        }

        internal function frame27():*
        {
            if (((this.facingRight) && (!(this.self.getGlobalVariable("meteor") == null))))
            {
                this.self.getGlobalVariable("meteor").getMC().x = (parent.x + 14);
                this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getGlobalVariable("meteor") == null))))
                {
                    this.self.getGlobalVariable("meteor").getMC().x = (parent.x - 14);
                    this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
                };
            };
        }

        internal function frame28():*
        {
            if (((this.facingRight) && (!(this.self.getGlobalVariable("meteor") == null))))
            {
                this.self.getGlobalVariable("meteor").getMC().x = (parent.x + 14);
                this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getGlobalVariable("meteor") == null))))
                {
                    this.self.getGlobalVariable("meteor").getMC().x = (parent.x - 14);
                    this.self.getGlobalVariable("meteor").getMC().y = (parent.y - 5);
                };
            };
            this.xframe = "attack";
            if (((!(this.self.getGlobalVariable("meteor") == null)) && (!(this.self.getGlobalVariable("meteor").isDead()))))
            {
                this.self.getGlobalVariable("meteor").updateProjectileStats({
                    "time_max":210,
                    "ghost":false,
                    "maxgravity":9
                });
                this.self.getGlobalVariable("meteor").refreshAttackID();
                this.self.getGlobalVariable("meteor").getStanceMC().gotoAndPlay("burn");
                this.controls = this.self.getControls();
                if (this.self.isFacingRight())
                {
                    if (this.controls.LEFT)
                    {
                        this.self.getGlobalVariable("meteor").angleControl(9, 295);
                    }
                    else
                    {
                        if (this.controls.RIGHT)
                        {
                            this.self.getGlobalVariable("meteor").angleControl(9, 335);
                        }
                        else
                        {
                            this.self.getGlobalVariable("meteor").angleControl(9, 315);
                        };
                    };
                }
                else
                {
                    if (this.controls.RIGHT)
                    {
                        this.self.getGlobalVariable("meteor").angleControl(9, 245);
                    }
                    else
                    {
                        if (this.controls.LEFT)
                        {
                            this.self.getGlobalVariable("meteor").angleControl(9, 205);
                        }
                        else
                        {
                            this.self.getGlobalVariable("meteor").angleControl(9, 225);
                        };
                    };
                };
            }
            else
            {
                this.gotoAndPlay("broken");
            };
            if (this.self.getGlobalVariable("meteor") != null)
            {
                SSF2API.playSound("bmfire");
            };
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT, this.killProjectile);
            this.self.updateAttackStats({"linkFrames":false});
            this.self.setGlobalVariable("meteorFrame", null);
        }

        internal function frame29():*
        {
            if (((this.facingRight) && (!(this.self.getCurrentProjectile() == null))))
            {
                this.self.getCurrentProjectile().getMC().x = (parent.x + 14);
                this.self.getCurrentProjectile().getMC().y = (parent.y - 5);
            }
            else
            {
                if (((!(this.facingRight)) && (!(this.self.getCurrentProjectile() == null))))
                {
                    this.self.getCurrentProjectile().getMC().x = (parent.x - 14);
                    this.self.getCurrentProjectile().getMC().y = (parent.y - 5);
                };
            };
        }

        internal function frame36():*
        {
            this.xframe = "attack";
        }

        internal function frame43():*
        {
            this.self.endAttack();
        }


    }
}//package blackmage_fla

