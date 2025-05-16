// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_entrance_17

package kirby_fla
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

    public dynamic class kirby_entrance_17 extends MovieClip 
    {

        public var __id0_:MovieClip;
        public var __animFactory___id0_af1:AnimatorFactory3D;
        public var __animArray___id0_af1:Array;
        public var ____motion___id0_af1_mat3DVec__:Vector.<Number>;
        public var ____motion___id0_af1_matArray__:Array;
        public var __motion___id0_af1:MotionBase;

        public function kirby_entrance_17()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 12, this.frame13, 40, this.frame41);
            if (this.__animFactory___id0_af1 == null)
            {
                this.__animArray___id0_af1 = new Array();
                this.__motion___id0_af1 = new MotionBase();
                this.__motion___id0_af1.duration = 15;
                this.__motion___id0_af1.overrideTargetTransform();
                this.__motion___id0_af1.addPropertyArray("blendMode", ["normal", "normal", "normal", "normal", "normal", "normal", "normal", "normal", "normal", "normal", "normal", "normal", "normal", "normal", "normal"]);
                this.__motion___id0_af1.addPropertyArray("cacheAsBitmap", [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]);
                this.__motion___id0_af1.addPropertyArray("opaqueBackground", [null, null, null, null, null, null, null, null, null, null, null, null, null, null, null]);
                this.__motion___id0_af1.addPropertyArray("visible", [true, true, true, true, true, true, true, true, true, true, true, true, true, true, true]);
                this.__motion___id0_af1.is3D = true;
                this.__motion___id0_af1.motion_internal::spanStart = 12;
                this.____motion___id0_af1_matArray__ = new Array();
                this.____motion___id0_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id0_af1_mat3DVec__[0] = 1;
                this.____motion___id0_af1_mat3DVec__[1] = 0;
                this.____motion___id0_af1_mat3DVec__[2] = 0;
                this.____motion___id0_af1_mat3DVec__[3] = 0;
                this.____motion___id0_af1_mat3DVec__[4] = 0;
                this.____motion___id0_af1_mat3DVec__[5] = 0.615661;
                this.____motion___id0_af1_mat3DVec__[6] = -0.788011;
                this.____motion___id0_af1_mat3DVec__[7] = 0;
                this.____motion___id0_af1_mat3DVec__[8] = 0;
                this.____motion___id0_af1_mat3DVec__[9] = 0.788011;
                this.____motion___id0_af1_mat3DVec__[10] = 0.615661;
                this.____motion___id0_af1_mat3DVec__[11] = 0;
                this.____motion___id0_af1_mat3DVec__[12] = -55;
                this.____motion___id0_af1_mat3DVec__[13] = 4.136232;
                this.____motion___id0_af1_mat3DVec__[14] = 17.296837;
                this.____motion___id0_af1_mat3DVec__[15] = 1;
                this.____motion___id0_af1_matArray__.push(new Matrix3D(this.____motion___id0_af1_mat3DVec__));
                this.____motion___id0_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id0_af1_mat3DVec__[0] = 0.901739;
                this.____motion___id0_af1_mat3DVec__[1] = 0.349336;
                this.____motion___id0_af1_mat3DVec__[2] = 0;
                this.____motion___id0_af1_mat3DVec__[3] = 0;
                this.____motion___id0_af1_mat3DVec__[4] = -0.215072;
                this.____motion___id0_af1_mat3DVec__[5] = 0.555166;
                this.____motion___id0_af1_mat3DVec__[6] = -0.762039;
                this.____motion___id0_af1_mat3DVec__[7] = 0;
                this.____motion___id0_af1_mat3DVec__[8] = -0.284662;
                this.____motion___id0_af1_mat3DVec__[9] = 0.734798;
                this.____motion___id0_af1_mat3DVec__[10] = 0.615661;
                this.____motion___id0_af1_mat3DVec__[11] = 0;
                this.____motion___id0_af1_mat3DVec__[12] = -59.816639;
                this.____motion___id0_af1_mat3DVec__[13] = -4.392621;
                this.____motion___id0_af1_mat3DVec__[14] = 16.745228;
                this.____motion___id0_af1_mat3DVec__[15] = 1;
                this.____motion___id0_af1_matArray__.push(new Matrix3D(this.____motion___id0_af1_mat3DVec__));
                this.____motion___id0_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id0_af1_mat3DVec__[0] = 0.690318;
                this.____motion___id0_af1_mat3DVec__[1] = 0.629308;
                this.____motion___id0_af1_mat3DVec__[2] = 0;
                this.____motion___id0_af1_mat3DVec__[3] = 0;
                this.____motion___id0_af1_mat3DVec__[4] = -0.38744;
                this.____motion___id0_af1_mat3DVec__[5] = 0.425002;
                this.____motion___id0_af1_mat3DVec__[6] = -0.736091;
                this.____motion___id0_af1_mat3DVec__[7] = 0;
                this.____motion___id0_af1_mat3DVec__[8] = -0.530879;
                this.____motion___id0_af1_mat3DVec__[9] = 0.582347;
                this.____motion___id0_af1_mat3DVec__[10] = 0.615661;
                this.____motion___id0_af1_mat3DVec__[11] = 0;
                this.____motion___id0_af1_mat3DVec__[12] = -63.147686;
                this.____motion___id0_af1_mat3DVec__[13] = -9.969381;
                this.____motion___id0_af1_mat3DVec__[14] = 16.154221;
                this.____motion___id0_af1_mat3DVec__[15] = 1;
                this.____motion___id0_af1_matArray__.push(new Matrix3D(this.____motion___id0_af1_mat3DVec__));
                this.____motion___id0_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id0_af1_mat3DVec__[0] = 0.401686;
                this.____motion___id0_af1_mat3DVec__[1] = 0.806693;
                this.____motion___id0_af1_mat3DVec__[2] = 0;
                this.____motion___id0_af1_mat3DVec__[3] = 0;
                this.____motion___id0_af1_mat3DVec__[4] = -0.49665;
                this.____motion___id0_af1_mat3DVec__[5] = 0.247302;
                this.____motion___id0_af1_mat3DVec__[6] = -0.710131;
                this.____motion___id0_af1_mat3DVec__[7] = 0;
                this.____motion___id0_af1_mat3DVec__[8] = -0.705398;
                this.____motion___id0_af1_mat3DVec__[9] = 0.351247;
                this.____motion___id0_af1_mat3DVec__[10] = 0.615661;
                this.____motion___id0_af1_mat3DVec__[11] = 0;
                this.____motion___id0_af1_mat3DVec__[12] = -66.1539;
                this.____motion___id0_af1_mat3DVec__[13] = -12.376727;
                this.____motion___id0_af1_mat3DVec__[14] = 15.602613;
                this.____motion___id0_af1_mat3DVec__[15] = 1;
                this.____motion___id0_af1_matArray__.push(new Matrix3D(this.____motion___id0_af1_mat3DVec__));
                this.____motion___id0_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id0_af1_mat3DVec__[0] = 0.08011;
                this.____motion___id0_af1_mat3DVec__[1] = 0.864521;
                this.____motion___id0_af1_mat3DVec__[2] = 0;
                this.____motion___id0_af1_mat3DVec__[3] = 0;
                this.____motion___id0_af1_mat3DVec__[4] = -0.532252;
                this.____motion___id0_af1_mat3DVec__[5] = 0.04932;
                this.____motion___id0_af1_mat3DVec__[6] = -0.684171;
                this.____motion___id0_af1_mat3DVec__[7] = 0;
                this.____motion___id0_af1_mat3DVec__[8] = -0.784649;
                this.____motion___id0_af1_mat3DVec__[9] = 0.072708;
                this.____motion___id0_af1_mat3DVec__[10] = 0.615661;
                this.____motion___id0_af1_mat3DVec__[11] = 0;
                this.____motion___id0_af1_mat3DVec__[12] = -70.08387;
                this.____motion___id0_af1_mat3DVec__[13] = -11.773073;
                this.____motion___id0_af1_mat3DVec__[14] = 15.011606;
                this.____motion___id0_af1_mat3DVec__[15] = 1;
                this.____motion___id0_af1_matArray__.push(new Matrix3D(this.____motion___id0_af1_mat3DVec__));
                this.____motion___id0_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id0_af1_mat3DVec__[0] = -0.228581;
                this.____motion___id0_af1_mat3DVec__[1] = 0.80338;
                this.____motion___id0_af1_mat3DVec__[2] = 0;
                this.____motion___id0_af1_mat3DVec__[3] = 0;
                this.____motion___id0_af1_mat3DVec__[4] = -0.49461;
                this.____motion___id0_af1_mat3DVec__[5] = -0.140729;
                this.____motion___id0_af1_mat3DVec__[6] = -0.658199;
                this.____motion___id0_af1_mat3DVec__[7] = 0;
                this.____motion___id0_af1_mat3DVec__[8] = -0.757929;
                this.____motion___id0_af1_mat3DVec__[9] = -0.215649;
                this.____motion___id0_af1_mat3DVec__[10] = 0.615661;
                this.____motion___id0_af1_mat3DVec__[11] = 0;
                this.____motion___id0_af1_mat3DVec__[12] = -75.875061;
                this.____motion___id0_af1_mat3DVec__[13] = -8.926332;
                this.____motion___id0_af1_mat3DVec__[14] = 14.459997;
                this.____motion___id0_af1_mat3DVec__[15] = 1;
                this.____motion___id0_af1_matArray__.push(new Matrix3D(this.____motion___id0_af1_mat3DVec__));
                this.____motion___id0_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id0_af1_mat3DVec__[0] = -0.483526;
                this.____motion___id0_af1_mat3DVec__[1] = 0.640291;
                this.____motion___id0_af1_mat3DVec__[2] = 0;
                this.____motion___id0_af1_mat3DVec__[3] = 0;
                this.____motion___id0_af1_mat3DVec__[4] = -0.394203;
                this.____motion___id0_af1_mat3DVec__[5] = -0.297688;
                this.____motion___id0_af1_mat3DVec__[6] = -0.632263;
                this.____motion___id0_af1_mat3DVec__[7] = 0;
                this.____motion___id0_af1_mat3DVec__[8] = -0.628846;
                this.____motion___id0_af1_mat3DVec__[9] = -0.474883;
                this.____motion___id0_af1_mat3DVec__[10] = 0.615661;
                this.____motion___id0_af1_mat3DVec__[11] = 0;
                this.____motion___id0_af1_mat3DVec__[12] = -84.153625;
                this.____motion___id0_af1_mat3DVec__[13] = -4.797259;
                this.____motion___id0_af1_mat3DVec__[14] = 13.86899;
                this.____motion___id0_af1_mat3DVec__[15] = 1;
                this.____motion___id0_af1_matArray__.push(new Matrix3D(this.____motion___id0_af1_mat3DVec__));
                this.____motion___id0_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id0_af1_mat3DVec__[0] = -0.654165;
                this.____motion___id0_af1_mat3DVec__[1] = 0.405042;
                this.____motion___id0_af1_mat3DVec__[2] = 0;
                this.____motion___id0_af1_mat3DVec__[3] = 0;
                this.____motion___id0_af1_mat3DVec__[4] = -0.249369;
                this.____motion___id0_af1_mat3DVec__[5] = -0.402744;
                this.____motion___id0_af1_mat3DVec__[6] = -0.606303;
                this.____motion___id0_af1_mat3DVec__[7] = 0;
                this.____motion___id0_af1_mat3DVec__[8] = -0.414834;
                this.____motion___id0_af1_mat3DVec__[9] = -0.66998;
                this.____motion___id0_af1_mat3DVec__[10] = 0.615661;
                this.____motion___id0_af1_mat3DVec__[11] = 0;
                this.____motion___id0_af1_mat3DVec__[12] = -94.907799;
                this.____motion___id0_af1_mat3DVec__[13] = -1.241231;
                this.____motion___id0_af1_mat3DVec__[14] = 13.317383;
                this.____motion___id0_af1_mat3DVec__[15] = 1;
                this.____motion___id0_af1_matArray__.push(new Matrix3D(this.____motion___id0_af1_mat3DVec__));
                this.____motion___id0_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id0_af1_mat3DVec__[0] = -0.723911;
                this.____motion___id0_af1_mat3DVec__[1] = 0.135322;
                this.____motion___id0_af1_mat3DVec__[2] = 0;
                this.____motion___id0_af1_mat3DVec__[3] = 0;
                this.____motion___id0_af1_mat3DVec__[4] = -0.083313;
                this.____motion___id0_af1_mat3DVec__[5] = -0.445684;
                this.____motion___id0_af1_mat3DVec__[6] = -0.580331;
                this.____motion___id0_af1_mat3DVec__[7] = 0;
                this.____motion___id0_af1_mat3DVec__[8] = -0.144797;
                this.____motion___id0_af1_mat3DVec__[9] = -0.774593;
                this.____motion___id0_af1_mat3DVec__[10] = 0.615661;
                this.____motion___id0_af1_mat3DVec__[11] = 0;
                this.____motion___id0_af1_mat3DVec__[12] = -108.088913;
                this.____motion___id0_af1_mat3DVec__[13] = 1.05917;
                this.____motion___id0_af1_mat3DVec__[14] = 12.726375;
                this.____motion___id0_af1_mat3DVec__[15] = 1;
                this.____motion___id0_af1_matArray__.push(new Matrix3D(this.____motion___id0_af1_mat3DVec__));
                this.____motion___id0_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id0_af1_mat3DVec__[0] = -0.570137;
                this.____motion___id0_af1_mat3DVec__[1] = -0.353014;
                this.____motion___id0_af1_mat3DVec__[2] = 0;
                this.____motion___id0_af1_mat3DVec__[3] = 0;
                this.____motion___id0_af1_mat3DVec__[4] = 0.217337;
                this.____motion___id0_af1_mat3DVec__[5] = -0.351011;
                this.____motion___id0_af1_mat3DVec__[6] = -0.528423;
                this.____motion___id0_af1_mat3DVec__[7] = 0;
                this.____motion___id0_af1_mat3DVec__[8] = 0.414834;
                this.____motion___id0_af1_mat3DVec__[9] = -0.66998;
                this.____motion___id0_af1_mat3DVec__[10] = 0.615661;
                this.____motion___id0_af1_mat3DVec__[11] = 0;
                this.____motion___id0_af1_mat3DVec__[12] = -138.809769;
                this.____motion___id0_af1_mat3DVec__[13] = -1.940933;
                this.____motion___id0_af1_mat3DVec__[14] = 11.583758;
                this.____motion___id0_af1_mat3DVec__[15] = 1;
                this.____motion___id0_af1_matArray__.push(new Matrix3D(this.____motion___id0_af1_mat3DVec__));
                this.____motion___id0_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id0_af1_mat3DVec__[0] = -0.384261;
                this.____motion___id0_af1_mat3DVec__[1] = -0.508843;
                this.____motion___id0_af1_mat3DVec__[2] = 0;
                this.____motion___id0_af1_mat3DVec__[3] = 0;
                this.____motion___id0_af1_mat3DVec__[4] = 0.313275;
                this.____motion___id0_af1_mat3DVec__[5] = -0.236574;
                this.____motion___id0_af1_mat3DVec__[6] = -0.502463;
                this.____motion___id0_af1_mat3DVec__[7] = 0;
                this.____motion___id0_af1_mat3DVec__[8] = 0.628846;
                this.____motion___id0_af1_mat3DVec__[9] = -0.474883;
                this.____motion___id0_af1_mat3DVec__[10] = 0.615661;
                this.____motion___id0_af1_mat3DVec__[11] = 0;
                this.____motion___id0_af1_mat3DVec__[12] = -149.898788;
                this.____motion___id0_af1_mat3DVec__[13] = -11.413265;
                this.____motion___id0_af1_mat3DVec__[14] = 11.032151;
                this.____motion___id0_af1_mat3DVec__[15] = 1;
                this.____motion___id0_af1_matArray__.push(new Matrix3D(this.____motion___id0_af1_mat3DVec__));
                this.____motion___id0_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id0_af1_mat3DVec__[0] = 0.052756;
                this.____motion___id0_af1_mat3DVec__[1] = -0.569323;
                this.____motion___id0_af1_mat3DVec__[2] = 0;
                this.____motion___id0_af1_mat3DVec__[3] = 0;
                this.____motion___id0_af1_mat3DVec__[4] = 0.35051;
                this.____motion___id0_af1_mat3DVec__[5] = 0.03248;
                this.____motion___id0_af1_mat3DVec__[6] = -0.450555;
                this.____motion___id0_af1_mat3DVec__[7] = 0;
                this.____motion___id0_af1_mat3DVec__[8] = 0.784649;
                this.____motion___id0_af1_mat3DVec__[9] = 0.072709;
                this.____motion___id0_af1_mat3DVec__[10] = 0.615661;
                this.____motion___id0_af1_mat3DVec__[11] = 0;
                this.____motion___id0_af1_mat3DVec__[12] = -150.995651;
                this.____motion___id0_af1_mat3DVec__[13] = -37.197952;
                this.____motion___id0_af1_mat3DVec__[14] = 9.889536;
                this.____motion___id0_af1_mat3DVec__[15] = 1;
                this.____motion___id0_af1_matArray__.push(new Matrix3D(this.____motion___id0_af1_mat3DVec__));
                this.____motion___id0_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id0_af1_mat3DVec__[0] = 0.240172;
                this.____motion___id0_af1_mat3DVec__[1] = -0.48233;
                this.____motion___id0_af1_mat3DVec__[2] = 0;
                this.____motion___id0_af1_mat3DVec__[3] = 0;
                this.____motion___id0_af1_mat3DVec__[4] = 0.296952;
                this.____motion___id0_af1_mat3DVec__[5] = 0.147865;
                this.____motion___id0_af1_mat3DVec__[6] = -0.424595;
                this.____motion___id0_af1_mat3DVec__[7] = 0;
                this.____motion___id0_af1_mat3DVec__[8] = 0.705398;
                this.____motion___id0_af1_mat3DVec__[9] = 0.351247;
                this.____motion___id0_af1_mat3DVec__[10] = 0.615661;
                this.____motion___id0_af1_mat3DVec__[11] = 0;
                this.____motion___id0_af1_mat3DVec__[12] = -144.728958;
                this.____motion___id0_af1_mat3DVec__[13] = -49.215649;
                this.____motion___id0_af1_mat3DVec__[14] = 9.337928;
                this.____motion___id0_af1_mat3DVec__[15] = 1;
                this.____motion___id0_af1_matArray__.push(new Matrix3D(this.____motion___id0_af1_mat3DVec__));
                this.____motion___id0_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id0_af1_mat3DVec__[0] = 0.440995;
                this.____motion___id0_af1_mat3DVec__[1] = -0.170842;
                this.____motion___id0_af1_mat3DVec__[2] = 0;
                this.____motion___id0_af1_mat3DVec__[3] = 0;
                this.____motion___id0_af1_mat3DVec__[4] = 0.105181;
                this.____motion___id0_af1_mat3DVec__[5] = 0.271504;
                this.____motion___id0_af1_mat3DVec__[6] = -0.372675;
                this.____motion___id0_af1_mat3DVec__[7] = 0;
                this.____motion___id0_af1_mat3DVec__[8] = 0.284662;
                this.____motion___id0_af1_mat3DVec__[9] = 0.734798;
                this.____motion___id0_af1_mat3DVec__[10] = 0.615661;
                this.____motion___id0_af1_mat3DVec__[11] = 0;
                this.____motion___id0_af1_mat3DVec__[12] = -125.380997;
                this.____motion___id0_af1_mat3DVec__[13] = -72.383232;
                this.____motion___id0_af1_mat3DVec__[14] = 8.195313;
                this.____motion___id0_af1_mat3DVec__[15] = 1;
                this.____motion___id0_af1_matArray__.push(new Matrix3D(this.____motion___id0_af1_mat3DVec__));
                this.____motion___id0_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id0_af1_mat3DVec__[0] = 0.439987;
                this.____motion___id0_af1_mat3DVec__[1] = 0;
                this.____motion___id0_af1_mat3DVec__[2] = 0;
                this.____motion___id0_af1_mat3DVec__[3] = 0;
                this.____motion___id0_af1_mat3DVec__[4] = 0;
                this.____motion___id0_af1_mat3DVec__[5] = 0.270883;
                this.____motion___id0_af1_mat3DVec__[6] = -0.346715;
                this.____motion___id0_af1_mat3DVec__[7] = 0;
                this.____motion___id0_af1_mat3DVec__[8] = 0;
                this.____motion___id0_af1_mat3DVec__[9] = 0.788011;
                this.____motion___id0_af1_mat3DVec__[10] = 0.615661;
                this.____motion___id0_af1_mat3DVec__[11] = 0;
                this.____motion___id0_af1_mat3DVec__[12] = -112.949997;
                this.____motion___id0_af1_mat3DVec__[13] = -82.29113;
                this.____motion___id0_af1_mat3DVec__[14] = 7.604304;
                this.____motion___id0_af1_mat3DVec__[15] = 1;
                this.____motion___id0_af1_matArray__.push(new Matrix3D(this.____motion___id0_af1_mat3DVec__));
                this.__motion___id0_af1.addPropertyArray("matrix3D", this.____motion___id0_af1_matArray__);
                this.__animArray___id0_af1.push(this.__motion___id0_af1);
                this.__animFactory___id0_af1 = new AnimatorFactory3D(null, this.__animArray___id0_af1);
                this.__animFactory___id0_af1.addTargetInfo(this, "__id0_", 0, true, 0, true, null, -1);
            };
        }

        internal function frame1():*
        {
        }

        internal function frame2():*
        {
            SSF2API.playSound("kirby_entrance");
        }

        internal function frame13():*
        {
            SSF2API.playSound("bombexplosion");
        }

        internal function frame41():*
        {
            SSF2API.getCharacter(this).endAttack();
        }


    }
}//package kirby_fla

