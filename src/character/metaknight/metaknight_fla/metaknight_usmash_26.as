// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//metaknight_fla.metaknight_usmash_26

package metaknight_fla
{
    import flash.display.MovieClip;
    import fl.motion.AnimatorFactory3D;
    import __AS3__.vec.Vector;
    import fl.motion.MotionBase;
    import fl.motion.motion_internal;
    import flash.geom.Matrix3D;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.geom.*;
    import flash.display.*;
    import __AS3__.vec.*;
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

    public dynamic class metaknight_usmash_26 extends MovieClip 
    {

        public var __id0_:MovieClip;
        public var __id1_:MovieClip;
        public var __id2_:MovieClip;
        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var xframe:String;
        public var __animFactory___id0_af1:AnimatorFactory3D;
        public var __animArray___id0_af1:Array;
        public var ____motion___id0_af1_mat3DVec__:Vector.<Number>;
        public var ____motion___id0_af1_matArray__:Array;
        public var __motion___id0_af1:MotionBase;
        public var __animFactory___id1_af1:AnimatorFactory3D;
        public var __animArray___id1_af1:Array;
        public var ____motion___id1_af1_mat3DVec__:Vector.<Number>;
        public var ____motion___id1_af1_matArray__:Array;
        public var __motion___id1_af1:MotionBase;
        public var __animFactory___id2_af1:AnimatorFactory3D;
        public var __animArray___id2_af1:Array;
        public var ____motion___id2_af1_mat3DVec__:Vector.<Number>;
        public var ____motion___id2_af1_matArray__:Array;
        public var __motion___id2_af1:MotionBase;

        public function metaknight_usmash_26()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 7, this.frame8, 8, this.frame9, 9, this.frame10, 12, this.frame13, 13, this.frame14, 16, this.frame17, 17, this.frame18, 24, this.frame25);
            if (this.__animFactory___id0_af1 == null)
            {
                this.__animArray___id0_af1 = new Array();
                this.__motion___id0_af1 = new MotionBase();
                this.__motion___id0_af1.duration = 1;
                this.__motion___id0_af1.overrideTargetTransform();
                this.__motion___id0_af1.addPropertyArray("blendMode", ["normal"]);
                this.__motion___id0_af1.addPropertyArray("cacheAsBitmap", [false]);
                this.__motion___id0_af1.addPropertyArray("opaqueBackground", [null]);
                this.__motion___id0_af1.addPropertyArray("visible", [true]);
                this.__motion___id0_af1.is3D = true;
                this.__motion___id0_af1.motion_internal::spanStart = 10;
                this.____motion___id0_af1_matArray__ = new Array();
                this.____motion___id0_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id0_af1_mat3DVec__[0] = -0.851375;
                this.____motion___id0_af1_mat3DVec__[1] = -0.181561;
                this.____motion___id0_af1_mat3DVec__[2] = -0.492134;
                this.____motion___id0_af1_mat3DVec__[3] = 0;
                this.____motion___id0_af1_mat3DVec__[4] = -0.460201;
                this.____motion___id0_af1_mat3DVec__[5] = 0.708781;
                this.____motion___id0_af1_mat3DVec__[6] = 0.534644;
                this.____motion___id0_af1_mat3DVec__[7] = 0;
                this.____motion___id0_af1_mat3DVec__[8] = 0.251744;
                this.____motion___id0_af1_mat3DVec__[9] = 0.681664;
                this.____motion___id0_af1_mat3DVec__[10] = -0.686993;
                this.____motion___id0_af1_mat3DVec__[11] = 0;
                this.____motion___id0_af1_mat3DVec__[12] = 63.115093;
                this.____motion___id0_af1_mat3DVec__[13] = 15.160291;
                this.____motion___id0_af1_mat3DVec__[14] = -0.816703;
                this.____motion___id0_af1_mat3DVec__[15] = 1;
                this.____motion___id0_af1_matArray__.push(new Matrix3D(this.____motion___id0_af1_mat3DVec__));
                this.__motion___id0_af1.addPropertyArray("matrix3D", this.____motion___id0_af1_matArray__);
                this.__animArray___id0_af1.push(this.__motion___id0_af1);
                this.__animFactory___id0_af1 = new AnimatorFactory3D(null, this.__animArray___id0_af1);
                this.__animFactory___id0_af1.addTargetInfo(this, "__id0_", 0, true, 0, true, null, -1);
            };
            if (this.__animFactory___id1_af1 == null)
            {
                this.__animArray___id1_af1 = new Array();
                this.__motion___id1_af1 = new MotionBase();
                this.__motion___id1_af1.duration = 1;
                this.__motion___id1_af1.overrideTargetTransform();
                this.__motion___id1_af1.addPropertyArray("blendMode", ["normal"]);
                this.__motion___id1_af1.addPropertyArray("cacheAsBitmap", [false]);
                this.__motion___id1_af1.addPropertyArray("opaqueBackground", [null]);
                this.__motion___id1_af1.addPropertyArray("visible", [true]);
                this.__motion___id1_af1.is3D = true;
                this.__motion___id1_af1.motion_internal::spanStart = 13;
                this.____motion___id1_af1_matArray__ = new Array();
                this.____motion___id1_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id1_af1_mat3DVec__[0] = -0.577601;
                this.____motion___id1_af1_mat3DVec__[1] = 0.016371;
                this.____motion___id1_af1_mat3DVec__[2] = -0.816155;
                this.____motion___id1_af1_mat3DVec__[3] = 0;
                this.____motion___id1_af1_mat3DVec__[4] = -0.637874;
                this.____motion___id1_af1_mat3DVec__[5] = 0.61485;
                this.____motion___id1_af1_mat3DVec__[6] = 0.463763;
                this.____motion___id1_af1_mat3DVec__[7] = 0;
                this.____motion___id1_af1_mat3DVec__[8] = 0.509405;
                this.____motion___id1_af1_mat3DVec__[9] = 0.788474;
                this.____motion___id1_af1_mat3DVec__[10] = -0.344696;
                this.____motion___id1_af1_mat3DVec__[11] = 0;
                this.____motion___id1_af1_mat3DVec__[12] = 64.675674;
                this.____motion___id1_af1_mat3DVec__[13] = 13.161291;
                this.____motion___id1_af1_mat3DVec__[14] = 9.217875;
                this.____motion___id1_af1_mat3DVec__[15] = 1;
                this.____motion___id1_af1_matArray__.push(new Matrix3D(this.____motion___id1_af1_mat3DVec__));
                this.__motion___id1_af1.addPropertyArray("matrix3D", this.____motion___id1_af1_matArray__);
                this.__animArray___id1_af1.push(this.__motion___id1_af1);
                this.__animFactory___id1_af1 = new AnimatorFactory3D(null, this.__animArray___id1_af1);
                this.__animFactory___id1_af1.addTargetInfo(this, "__id1_", 0, true, 0, true, null, -1);
            };
            if (this.__animFactory___id2_af1 == null)
            {
                this.__animArray___id2_af1 = new Array();
                this.__motion___id2_af1 = new MotionBase();
                this.__motion___id2_af1.duration = 1;
                this.__motion___id2_af1.overrideTargetTransform();
                this.__motion___id2_af1.addPropertyArray("blendMode", ["normal"]);
                this.__motion___id2_af1.addPropertyArray("cacheAsBitmap", [false]);
                this.__motion___id2_af1.addPropertyArray("opaqueBackground", [null]);
                this.__motion___id2_af1.addPropertyArray("visible", [true]);
                this.__motion___id2_af1.is3D = true;
                this.__motion___id2_af1.motion_internal::spanStart = 17;
                this.____motion___id2_af1_matArray__ = new Array();
                this.____motion___id2_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id2_af1_mat3DVec__[0] = 0.184494;
                this.____motion___id2_af1_mat3DVec__[1] = -0.614072;
                this.____motion___id2_af1_mat3DVec__[2] = -0.767384;
                this.____motion___id2_af1_mat3DVec__[3] = 0;
                this.____motion___id2_af1_mat3DVec__[4] = -0.852291;
                this.____motion___id2_af1_mat3DVec__[5] = 0.288871;
                this.____motion___id2_af1_mat3DVec__[6] = -0.436066;
                this.____motion___id2_af1_mat3DVec__[7] = 0;
                this.____motion___id2_af1_mat3DVec__[8] = 0.489451;
                this.____motion___id2_af1_mat3DVec__[9] = 0.734486;
                this.____motion___id2_af1_mat3DVec__[10] = -0.470073;
                this.____motion___id2_af1_mat3DVec__[11] = 0;
                this.____motion___id2_af1_mat3DVec__[12] = 58.60268;
                this.____motion___id2_af1_mat3DVec__[13] = 32.587059;
                this.____motion___id2_af1_mat3DVec__[14] = 30.469934;
                this.____motion___id2_af1_mat3DVec__[15] = 1;
                this.____motion___id2_af1_matArray__.push(new Matrix3D(this.____motion___id2_af1_mat3DVec__));
                this.__motion___id2_af1.addPropertyArray("matrix3D", this.____motion___id2_af1_matArray__);
                this.__animArray___id2_af1.push(this.__motion___id2_af1);
                this.__animFactory___id2_af1 = new AnimatorFactory3D(null, this.__animArray___id2_af1);
                this.__animFactory___id2_af1.addTargetInfo(this, "__id2_", 0, true, 0, true, null, -1);
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playVoiceSound(1);
            };
        }

        internal function frame3():*
        {
            this.xframe = "charging";
        }

        internal function frame8():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame9():*
        {
            this.xframe = "attack";
            this.self.playAttackSound(1);
        }

        internal function frame10():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame13():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame14():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "damage":2,
                "power":20
            });
            this.self.updateAttackBoxStats(2, {
                "damage":2,
                "power":20
            });
        }

        internal function frame17():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame18():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "damage":4,
                "power":42,
                "kbConstant":153,
                "direction":70
            });
            this.self.updateAttackBoxStats(2, {
                "damage":4,
                "power":42,
                "kbConstant":153,
                "direction":70
            });
        }

        internal function frame25():*
        {
            this.self.endAttack();
        }


    }
}//package metaknight_fla

