// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//lloyd_fla.lloyd_special_96

package lloyd_fla
{
    import flash.display.MovieClip;
    import fl.motion.AnimatorFactory3D;
    import __AS3__.vec.Vector;
    import fl.motion.MotionBase;
    import fl.motion.motion_internal;
    import flash.geom.Matrix3D;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
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

    public dynamic class lloyd_special_96 extends MovieClip 
    {

        public var __id0_:MovieClip;
        public var __id1_:MovieClip;
        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var range:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var continuePlaying:Boolean;
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

        public function lloyd_special_96()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 22, this.frame23, 23, this.frame24, 73, this.frame74, 78, this.frame79, 113, this.frame114, 114, this.frame115, 138, this.frame139);
            if (this.__animFactory___id0_af1 == null)
            {
                this.__animArray___id0_af1 = new Array();
                this.__motion___id0_af1 = new MotionBase();
                this.__motion___id0_af1.duration = 3;
                this.__motion___id0_af1.overrideTargetTransform();
                this.__motion___id0_af1.addPropertyArray("blendMode", ["normal", "normal", "normal"]);
                this.__motion___id0_af1.addPropertyArray("cacheAsBitmap", [false, false, false]);
                this.__motion___id0_af1.addPropertyArray("opaqueBackground", [null, null, null]);
                this.__motion___id0_af1.addPropertyArray("visible", [true, true, true]);
                this.__motion___id0_af1.is3D = true;
                this.__motion___id0_af1.motion_internal::spanStart = 112;
                this.____motion___id0_af1_matArray__ = new Array();
                this.____motion___id0_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id0_af1_mat3DVec__[0] = 1.228557;
                this.____motion___id0_af1_mat3DVec__[1] = -0.108313;
                this.____motion___id0_af1_mat3DVec__[2] = 0;
                this.____motion___id0_af1_mat3DVec__[3] = 0;
                this.____motion___id0_af1_mat3DVec__[4] = 0.162469;
                this.____motion___id0_af1_mat3DVec__[5] = 1.842827;
                this.____motion___id0_af1_mat3DVec__[6] = 3.204252;
                this.____motion___id0_af1_mat3DVec__[7] = 0;
                this.____motion___id0_af1_mat3DVec__[8] = -0.076057;
                this.____motion___id0_af1_mat3DVec__[9] = -0.862679;
                this.____motion___id0_af1_mat3DVec__[10] = 0.5;
                this.____motion___id0_af1_mat3DVec__[11] = 0;
                this.____motion___id0_af1_mat3DVec__[12] = 136.100006;
                this.____motion___id0_af1_mat3DVec__[13] = 124.150002;
                this.____motion___id0_af1_mat3DVec__[14] = 0;
                this.____motion___id0_af1_mat3DVec__[15] = 1;
                this.____motion___id0_af1_matArray__.push(new Matrix3D(this.____motion___id0_af1_mat3DVec__));
                this.____motion___id0_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id0_af1_mat3DVec__[0] = 1.117856;
                this.____motion___id0_af1_mat3DVec__[1] = -0.098554;
                this.____motion___id0_af1_mat3DVec__[2] = 0;
                this.____motion___id0_af1_mat3DVec__[3] = 0;
                this.____motion___id0_af1_mat3DVec__[4] = 0.147836;
                this.____motion___id0_af1_mat3DVec__[5] = 1.676845;
                this.____motion___id0_af1_mat3DVec__[6] = 2.915647;
                this.____motion___id0_af1_mat3DVec__[7] = 0;
                this.____motion___id0_af1_mat3DVec__[8] = -0.076057;
                this.____motion___id0_af1_mat3DVec__[9] = -0.862679;
                this.____motion___id0_af1_mat3DVec__[10] = 0.5;
                this.____motion___id0_af1_mat3DVec__[11] = 0;
                this.____motion___id0_af1_mat3DVec__[12] = 136.099991;
                this.____motion___id0_af1_mat3DVec__[13] = 124.150002;
                this.____motion___id0_af1_mat3DVec__[14] = 0;
                this.____motion___id0_af1_mat3DVec__[15] = 1;
                this.____motion___id0_af1_matArray__.push(new Matrix3D(this.____motion___id0_af1_mat3DVec__));
                this.____motion___id0_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id0_af1_mat3DVec__[0] = 1.007202;
                this.____motion___id0_af1_mat3DVec__[1] = -0.088798;
                this.____motion___id0_af1_mat3DVec__[2] = 0;
                this.____motion___id0_af1_mat3DVec__[3] = 0;
                this.____motion___id0_af1_mat3DVec__[4] = 0.133199;
                this.____motion___id0_af1_mat3DVec__[5] = 1.510825;
                this.____motion___id0_af1_mat3DVec__[6] = 2.626976;
                this.____motion___id0_af1_mat3DVec__[7] = 0;
                this.____motion___id0_af1_mat3DVec__[8] = -0.076057;
                this.____motion___id0_af1_mat3DVec__[9] = -0.862679;
                this.____motion___id0_af1_mat3DVec__[10] = 0.5;
                this.____motion___id0_af1_mat3DVec__[11] = 0;
                this.____motion___id0_af1_mat3DVec__[12] = 136.099991;
                this.____motion___id0_af1_mat3DVec__[13] = 124.150002;
                this.____motion___id0_af1_mat3DVec__[14] = 0;
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
                this.__motion___id1_af1.duration = 12;
                this.__motion___id1_af1.overrideTargetTransform();
                this.__motion___id1_af1.addPropertyArray("blendMode", ["normal", "normal", "normal", "normal", "normal", "normal", "normal", "normal", "normal", "normal", "normal", "normal"]);
                this.__motion___id1_af1.addPropertyArray("cacheAsBitmap", [false, false, false, false, false, false, false, false, false, false, false, false]);
                this.__motion___id1_af1.addPropertyArray("opaqueBackground", [null, null, null, null, null, null, null, null, null, null, null, null]);
                this.__motion___id1_af1.addPropertyArray("visible", [true, true, true, true, true, true, true, true, true, true, true, true]);
                this.__motion___id1_af1.is3D = true;
                this.__motion___id1_af1.motion_internal::spanStart = 116;
                this.____motion___id1_af1_matArray__ = new Array();
                this.____motion___id1_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id1_af1_mat3DVec__[0] = 0.848423;
                this.____motion___id1_af1_mat3DVec__[1] = 0.066359;
                this.____motion___id1_af1_mat3DVec__[2] = -0.111883;
                this.____motion___id1_af1_mat3DVec__[3] = 0;
                this.____motion___id1_af1_mat3DVec__[4] = 0.207794;
                this.____motion___id1_af1_mat3DVec__[5] = 1.115249;
                this.____motion___id1_af1_mat3DVec__[6] = 2.237202;
                this.____motion___id1_af1_mat3DVec__[7] = 0;
                this.____motion___id1_af1_mat3DVec__[8] = 0.126906;
                this.____motion___id1_af1_mat3DVec__[9] = -0.892383;
                this.____motion___id1_af1_mat3DVec__[10] = 0.433067;
                this.____motion___id1_af1_mat3DVec__[11] = 0;
                this.____motion___id1_af1_mat3DVec__[12] = 135.537491;
                this.____motion___id1_af1_mat3DVec__[13] = 113.608337;
                this.____motion___id1_af1_mat3DVec__[14] = 1E-6;
                this.____motion___id1_af1_mat3DVec__[15] = 1;
                this.____motion___id1_af1_matArray__.push(new Matrix3D(this.____motion___id1_af1_mat3DVec__));
                this.____motion___id1_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id1_af1_mat3DVec__[0] = 0.765523;
                this.____motion___id1_af1_mat3DVec__[1] = 0.190623;
                this.____motion___id1_af1_mat3DVec__[2] = -0.211081;
                this.____motion___id1_af1_mat3DVec__[3] = 0;
                this.____motion___id1_af1_mat3DVec__[4] = 0.331632;
                this.____motion___id1_af1_mat3DVec__[5] = 0.969165;
                this.____motion___id1_af1_mat3DVec__[6] = 2.077953;
                this.____motion___id1_af1_mat3DVec__[7] = 0;
                this.____motion___id1_af1_mat3DVec__[8] = 0.317493;
                this.____motion___id1_af1_mat3DVec__[9] = -0.877786;
                this.____motion___id1_af1_mat3DVec__[10] = 0.358733;
                this.____motion___id1_af1_mat3DVec__[11] = 0;
                this.____motion___id1_af1_mat3DVec__[12] = 134.974991;
                this.____motion___id1_af1_mat3DVec__[13] = 103.06665;
                this.____motion___id1_af1_mat3DVec__[14] = 1E-6;
                this.____motion___id1_af1_mat3DVec__[15] = 1;
                this.____motion___id1_af1_matArray__.push(new Matrix3D(this.____motion___id1_af1_mat3DVec__));
                this.____motion___id1_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id1_af1_mat3DVec__[0] = 0.656808;
                this.____motion___id1_af1_mat3DVec__[1] = 0.285499;
                this.____motion___id1_af1_mat3DVec__[2] = -0.296197;
                this.____motion___id1_af1_mat3DVec__[3] = 0;
                this.____motion___id1_af1_mat3DVec__[4] = 0.452047;
                this.____motion___id1_af1_mat3DVec__[5] = 0.900919;
                this.____motion___id1_af1_mat3DVec__[6] = 1.87078;
                this.____motion___id1_af1_mat3DVec__[7] = 0;
                this.____motion___id1_af1_mat3DVec__[8] = 0.486333;
                this.____motion___id1_af1_mat3DVec__[9] = -0.827381;
                this.____motion___id1_af1_mat3DVec__[10] = 0.28093;
                this.____motion___id1_af1_mat3DVec__[11] = 0;
                this.____motion___id1_af1_mat3DVec__[12] = 134.412491;
                this.____motion___id1_af1_mat3DVec__[13] = 92.524986;
                this.____motion___id1_af1_mat3DVec__[14] = 1E-6;
                this.____motion___id1_af1_mat3DVec__[15] = 1;
                this.____motion___id1_af1_matArray__.push(new Matrix3D(this.____motion___id1_af1_mat3DVec__));
                this.____motion___id1_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id1_af1_mat3DVec__[0] = 0.532815;
                this.____motion___id1_af1_mat3DVec__[1] = 0.346068;
                this.____motion___id1_af1_mat3DVec__[2] = -0.366205;
                this.____motion___id1_af1_mat3DVec__[3] = 0;
                this.____motion___id1_af1_mat3DVec__[4] = 0.539388;
                this.____motion___id1_af1_mat3DVec__[5] = 0.892347;
                this.____motion___id1_af1_mat3DVec__[6] = 1.628072;
                this.____motion___id1_af1_mat3DVec__[7] = 0;
                this.____motion___id1_af1_mat3DVec__[8] = 0.627893;
                this.____motion___id1_af1_mat3DVec__[9] = -0.751172;
                this.____motion___id1_af1_mat3DVec__[10] = 0.203694;
                this.____motion___id1_af1_mat3DVec__[11] = 0;
                this.____motion___id1_af1_mat3DVec__[12] = 133.850006;
                this.____motion___id1_af1_mat3DVec__[13] = 81.98333;
                this.____motion___id1_af1_mat3DVec__[14] = 3E-6;
                this.____motion___id1_af1_mat3DVec__[15] = 1;
                this.____motion___id1_af1_matArray__.push(new Matrix3D(this.____motion___id1_af1_mat3DVec__));
                this.____motion___id1_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id1_af1_mat3DVec__[0] = 0.404762;
                this.____motion___id1_af1_mat3DVec__[1] = 0.371088;
                this.____motion___id1_af1_mat3DVec__[2] = -0.420576;
                this.____motion___id1_af1_mat3DVec__[3] = 0;
                this.____motion___id1_af1_mat3DVec__[4] = 0.57571;
                this.____motion___id1_af1_mat3DVec__[5] = 0.917701;
                this.____motion___id1_af1_mat3DVec__[6] = 1.363781;
                this.____motion___id1_af1_mat3DVec__[7] = 0;
                this.____motion___id1_af1_mat3DVec__[8] = 0.740471;
                this.____motion___id1_af1_mat3DVec__[9] = -0.659199;
                this.____motion___id1_af1_mat3DVec__[10] = 0.130997;
                this.____motion___id1_af1_mat3DVec__[11] = 0;
                this.____motion___id1_af1_mat3DVec__[12] = 133.287491;
                this.____motion___id1_af1_mat3DVec__[13] = 71.441666;
                this.____motion___id1_af1_mat3DVec__[14] = 3E-6;
                this.____motion___id1_af1_mat3DVec__[15] = 1;
                this.____motion___id1_af1_matArray__.push(new Matrix3D(this.____motion___id1_af1_mat3DVec__));
                this.____motion___id1_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id1_af1_mat3DVec__[0] = 0.283112;
                this.____motion___id1_af1_mat3DVec__[1] = 0.362697;
                this.____motion___id1_af1_mat3DVec__[2] = -0.459119;
                this.____motion___id1_af1_mat3DVec__[3] = 0;
                this.____motion___id1_af1_mat3DVec__[4] = 0.55577;
                this.____motion___id1_af1_mat3DVec__[5] = 0.948938;
                this.____motion___id1_af1_mat3DVec__[6] = 1.092356;
                this.____motion___id1_af1_mat3DVec__[7] = 0;
                this.____motion___id1_af1_mat3DVec__[8] = 0.825667;
                this.____motion___id1_af1_mat3DVec__[9] = -0.560215;
                this.____motion___id1_af1_mat3DVec__[10] = 0.066579;
                this.____motion___id1_af1_mat3DVec__[11] = 0;
                this.____motion___id1_af1_mat3DVec__[12] = 132.725006;
                this.____motion___id1_af1_mat3DVec__[13] = 60.899994;
                this.____motion___id1_af1_mat3DVec__[14] = 4E-6;
                this.____motion___id1_af1_mat3DVec__[15] = 1;
                this.____motion___id1_af1_matArray__.push(new Matrix3D(this.____motion___id1_af1_mat3DVec__));
                this.____motion___id1_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id1_af1_mat3DVec__[0] = 0.176788;
                this.____motion___id1_af1_mat3DVec__[1] = 0.32609;
                this.____motion___id1_af1_mat3DVec__[2] = -0.482148;
                this.____motion___id1_af1_mat3DVec__[3] = 0;
                this.____motion___id1_af1_mat3DVec__[4] = 0.485966;
                this.____motion___id1_af1_mat3DVec__[5] = 0.960863;
                this.____motion___id1_af1_mat3DVec__[6] = 0.828046;
                this.____motion___id1_af1_mat3DVec__[7] = 0;
                this.____motion___id1_af1_mat3DVec__[8] = 0.887438;
                this.____motion___id1_af1_mat3DVec__[9] = -0.46072;
                this.____motion___id1_af1_mat3DVec__[10] = 0.013797;
                this.____motion___id1_af1_mat3DVec__[11] = 0;
                this.____motion___id1_af1_mat3DVec__[12] = 132.162506;
                this.____motion___id1_af1_mat3DVec__[13] = 50.358326;
                this.____motion___id1_af1_mat3DVec__[14] = 7E-6;
                this.____motion___id1_af1_mat3DVec__[15] = 1;
                this.____motion___id1_af1_matArray__.push(new Matrix3D(this.____motion___id1_af1_mat3DVec__));
                this.____motion___id1_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id1_af1_mat3DVec__[0] = 0.092253;
                this.____motion___id1_af1_mat3DVec__[1] = 0.268631;
                this.____motion___id1_af1_mat3DVec__[2] = -0.490326;
                this.____motion___id1_af1_mat3DVec__[3] = 0;
                this.____motion___id1_af1_mat3DVec__[4] = 0.381486;
                this.____motion___id1_af1_mat3DVec__[5] = 0.935126;
                this.____motion___id1_af1_mat3DVec__[6] = 0.584095;
                this.____motion___id1_af1_mat3DVec__[7] = 0;
                this.____motion___id1_af1_mat3DVec__[8] = 0.930902;
                this.____motion___id1_af1_mat3DVec__[9] = -0.364446;
                this.____motion___id1_af1_mat3DVec__[10] = -0.024521;
                this.____motion___id1_af1_mat3DVec__[11] = 0;
                this.____motion___id1_af1_mat3DVec__[12] = 131.600006;
                this.____motion___id1_af1_mat3DVec__[13] = 39.816658;
                this.____motion___id1_af1_mat3DVec__[14] = 1.3E-5;
                this.____motion___id1_af1_mat3DVec__[15] = 1;
                this.____motion___id1_af1_matArray__.push(new Matrix3D(this.____motion___id1_af1_mat3DVec__));
                this.____motion___id1_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id1_af1_mat3DVec__[0] = 0.03309;
                this.____motion___id1_af1_mat3DVec__[1] = 0.198957;
                this.____motion___id1_af1_mat3DVec__[2] = -0.484706;
                this.____motion___id1_af1_mat3DVec__[3] = 0;
                this.____motion___id1_af1_mat3DVec__[4] = 0.262238;
                this.____motion___id1_af1_mat3DVec__[5] = 0.862316;
                this.____motion___id1_af1_mat3DVec__[6] = 0.371858;
                this.____motion___id1_af1_mat3DVec__[7] = 0;
                this.____motion___id1_af1_mat3DVec__[8] = 0.961087;
                this.____motion___id1_af1_mat3DVec__[9] = -0.272359;
                this.____motion___id1_af1_mat3DVec__[10] = -0.046184;
                this.____motion___id1_af1_mat3DVec__[11] = 0;
                this.____motion___id1_af1_mat3DVec__[12] = 131.037506;
                this.____motion___id1_af1_mat3DVec__[13] = 29.27499;
                this.____motion___id1_af1_mat3DVec__[14] = 7E-6;
                this.____motion___id1_af1_mat3DVec__[15] = 1;
                this.____motion___id1_af1_matArray__.push(new Matrix3D(this.____motion___id1_af1_mat3DVec__));
                this.____motion___id1_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id1_af1_mat3DVec__[0] = -0.000149;
                this.____motion___id1_af1_mat3DVec__[1] = 0.125931;
                this.____motion___id1_af1_mat3DVec__[2] = -0.466628;
                this.____motion___id1_af1_mat3DVec__[3] = 0;
                this.____motion___id1_af1_mat3DVec__[4] = 0.148654;
                this.____motion___id1_af1_mat3DVec__[5] = 0.742538;
                this.____motion___id1_af1_mat3DVec__[6] = 0.200345;
                this.____motion___id1_af1_mat3DVec__[7] = 0;
                this.____motion___id1_af1_mat3DVec__[8] = 0.981828;
                this.____motion___id1_af1_mat3DVec__[9] = -0.18314;
                this.____motion___id1_af1_mat3DVec__[10] = -0.049738;
                this.____motion___id1_af1_mat3DVec__[11] = 0;
                this.____motion___id1_af1_mat3DVec__[12] = 130.475006;
                this.____motion___id1_af1_mat3DVec__[13] = 18.73333;
                this.____motion___id1_af1_mat3DVec__[14] = 6E-6;
                this.____motion___id1_af1_mat3DVec__[15] = 1;
                this.____motion___id1_af1_matArray__.push(new Matrix3D(this.____motion___id1_af1_mat3DVec__));
                this.____motion___id1_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id1_af1_mat3DVec__[0] = -0.009736;
                this.____motion___id1_af1_mat3DVec__[1] = 0.057696;
                this.____motion___id1_af1_mat3DVec__[2] = -0.437757;
                this.____motion___id1_af1_mat3DVec__[3] = 0;
                this.____motion___id1_af1_mat3DVec__[4] = 0.057826;
                this.____motion___id1_af1_mat3DVec__[5] = 0.583959;
                this.____motion___id1_af1_mat3DVec__[6] = 0.075679;
                this.____motion___id1_af1_mat3DVec__[7] = 0;
                this.____motion___id1_af1_mat3DVec__[8] = 0.994968;
                this.____motion___id1_af1_mat3DVec__[9] = -0.094052;
                this.____motion___id1_af1_mat3DVec__[10] = -0.034525;
                this.____motion___id1_af1_mat3DVec__[11] = 0;
                this.____motion___id1_af1_mat3DVec__[12] = 129.912506;
                this.____motion___id1_af1_mat3DVec__[13] = 8.191659;
                this.____motion___id1_af1_mat3DVec__[14] = 7E-6;
                this.____motion___id1_af1_mat3DVec__[15] = 1;
                this.____motion___id1_af1_matArray__.push(new Matrix3D(this.____motion___id1_af1_mat3DVec__));
                this.____motion___id1_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id1_af1_mat3DVec__[0] = -0.000282;
                this.____motion___id1_af1_mat3DVec__[1] = 0.000815;
                this.____motion___id1_af1_mat3DVec__[2] = -0.399993;
                this.____motion___id1_af1_mat3DVec__[3] = 0;
                this.____motion___id1_af1_mat3DVec__[4] = 0.000817;
                this.____motion___id1_af1_mat3DVec__[5] = 0.399992;
                this.____motion___id1_af1_mat3DVec__[6] = 0.000814;
                this.____motion___id1_af1_mat3DVec__[7] = 0;
                this.____motion___id1_af1_mat3DVec__[8] = 0.999998;
                this.____motion___id1_af1_mat3DVec__[9] = -0.002041;
                this.____motion___id1_af1_mat3DVec__[10] = -0.000709;
                this.____motion___id1_af1_mat3DVec__[11] = 0;
                this.____motion___id1_af1_mat3DVec__[12] = 129.350006;
                this.____motion___id1_af1_mat3DVec__[13] = -2.350002;
                this.____motion___id1_af1_mat3DVec__[14] = 8E-6;
                this.____motion___id1_af1_mat3DVec__[15] = 1;
                this.____motion___id1_af1_matArray__.push(new Matrix3D(this.____motion___id1_af1_mat3DVec__));
                this.__motion___id1_af1.addPropertyArray("matrix3D", this.____motion___id1_af1_matArray__);
                this.__animArray___id1_af1.push(this.__motion___id1_af1);
                this.__animFactory___id1_af1 = new AnimatorFactory3D(null, this.__animArray___id1_af1);
                this.__animFactory___id1_af1.addTargetInfo(this, "__id1_", 0, true, 0, true, null, -1);
            };
        }

        public function keepGoing(_arg_1:*=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT, this.keepGoing);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT_SHIELD, this.keepGoing);
            if (this.self.isFacingRight())
            {
                _arg_1.data.receiver.setX((this.self.getX() + 25));
            }
            else
            {
                _arg_1.data.receiver.setX((this.self.getX() - 25));
            };
            _arg_1.data.receiver.setY(this.self.getY());
            this.continuePlaying = true;
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.continuePlaying = false;
                this.self.playVoiceSound(1);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT, this.keepGoing);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT_SHIELD, this.keepGoing);
            };
        }

        internal function frame5():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame23():*
        {
            if (!this.continuePlaying)
            {
                this.self.endAttack();
            };
        }

        internal function frame24():*
        {
            SSF2API.playSound("tos_swordcut");
            this.self.updateAttackBoxStats(1, {
                "damage":8,
                "priority":7,
                "hitStun":2,
                "selfHitStun":0,
                "camShake":2,
                "effect_id":"effect_hit3",
                "direction":-5,
                "power":0,
                "kbConstant":0,
                "effectSound":"sw_scratch"
            });
            this.self.updateAttackBoxStats(1, {"hasEffect":false});
        }

        internal function frame74():*
        {
            this.self.playVoiceSound(2);
        }

        internal function frame79():*
        {
            this.self.updateAttackBoxStats(1, {"hitStun":40});
            this.self.refreshAttackID();
        }

        internal function frame114():*
        {
            this.self.playAttackSound(2);
            this.self.playAttackSound(3);
            this.self.updateAttackBoxStats(1, {
                "power":0,
                "kbConstant":40,
                "hitStun":6,
                "selfHitStun":6,
                "damage":40,
                "direction":75,
                "hasEffect":true
            });
        }

        internal function frame115():*
        {
            this.self.refreshAttackID();
            SSF2API.shakeCamera(10);
            this.self.updateAttackStats({"refreshRate":1000});
            this.self.releaseOpponent();
        }

        internal function frame139():*
        {
            this.self.endAttack();
        }


    }
}//package lloyd_fla

