// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fla.ness_psimagnet_49

package ness_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.system.*;
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
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class ness_psimagnet_49 extends MovieClip 
    {

        public var absorbBox:MovieClip;
        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var continuePlaying:*;
        public var handled:*;
        public var restart:*;

        public function ness_psimagnet_49()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5, 6, this.frame7, 9, this.frame10, 14, this.frame15, 17, this.frame18, 18, this.frame19, 23, this.frame24, 28, this.frame29, 29, this.frame30, 32, this.frame33, 36, this.frame37, 40, this.frame41, 41, this.frame42, 47, this.frame48);
        }

        public function heal(_arg_1:*):*
        {
            var _local_2:Number = _arg_1.attackBox.damage;
            SSF2API.print(("" + _local_2));
            this.self.recover(_local_2);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.continuePlaying = false;
                this.handled = false;
                this.restart = false;
                this.self.playAttackSound(2);
            };
        }

        internal function frame4():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.CHAR_ABSORB, this.heal);
        }

        internal function frame5():*
        {
            this.self.updateAttackStats({
                "allowJump":true,
                "allowDoubleJump":true
            });
            this.self.updateAttackBoxStats(1, {"damage":0});
            this.self.refreshAttackID();
        }

        internal function frame7():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame10():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame15():*
        {
            if (((!(this.continuePlaying == true)) && (!(this.restart))))
            {
                this.gotoAndPlay("finish");
            }
            else
            {
                play();
            };
        }

        internal function frame18():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame19():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame24():*
        {
            if (((!(this.continuePlaying == true)) && (!(this.restart))))
            {
                this.gotoAndPlay("finish");
            }
            else
            {
                play();
            };
        }

        internal function frame29():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame30():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame33():*
        {
            if (((!(this.continuePlaying == true)) && (!(this.restart))))
            {
                this.gotoAndPlay("finish");
            }
            else
            {
                play();
            };
        }

        internal function frame37():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame41():*
        {
            if (((!(this.continuePlaying == true)) && (!(this.restart))))
            {
                this.gotoAndPlay("finish");
            }
            else
            {
                gotoAndPlay("loop");
            };
        }

        internal function frame42():*
        {
            this.self.updateAttackBoxStats(1, {"effectSound":null});
            this.self.updateAttackBoxStats(1, {
                "damage":0,
                "hitStun":0,
                "selfHitStun":0,
                "direction":-4,
                "power":40,
                "hasEffect":false
            });
            SSF2API.removeEventListener(this.self, SSF2Event.CHAR_ABSORB, this.heal);
        }

        internal function frame48():*
        {
            this.self.endAttack();
        }


    }
}//package ness_fla

