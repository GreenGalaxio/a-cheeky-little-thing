// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//sonicThrustGlow

package 
{
    import flash.display.MovieClip;

    public dynamic class sonicThrustGlow extends MovieClip 
    {

        public function sonicThrustGlow()
        {
            addFrameScript(9, this.frame10);
        }

        internal function frame10():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

