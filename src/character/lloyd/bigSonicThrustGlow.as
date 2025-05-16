// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//bigSonicThrustGlow

package 
{
    import flash.display.MovieClip;

    public dynamic class bigSonicThrustGlow extends MovieClip 
    {

        public function bigSonicThrustGlow()
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

